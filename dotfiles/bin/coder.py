#!/usr/bin/env python3.12

import gradio as gr
import jinja2
import textwrap
import subprocess
import os
import re

FIND_CODE_REGEX = "```(.*?)(?:```|$)"

MODELS = [
    ("qwen3 0.6b", "ollama/qwen3:0.6b"),
    ("qwen3 4b", "ollama/qwen3:4b"),
    ("qwen3 8b", "ollama/qwen3:8b"),
    ("qwen3 14b", "ollama/qwen3:14b"),
]

PROMPT_TEMPLATE = textwrap.dedent(
    """
    {{message}}
    {%- if selection and include_selection %}

    Selected code:
    ```
    {{selection}}
    ```

    {%- endif %}
    {%- if include_open_file %}

    ``` {{open_file}}
    {{open_file|cat}}
    ```

    {%- endif %}
    {%- for file in project_files %}

    ``` {{file}}
    {{file|cat}}
    ```
    {%- endfor %}
    {%- if dont_think %}

    /no_think
    {%- endif %}
    """
).strip("\n ")


def nvim(expr):
    out = subprocess.run(
        ["nvr", "--remote-expr", expr],
        capture_output=True,
        text=True,
    ).stdout
    return out


def copy(data):
    subprocess.run("pbcopy", text=True, input=data)


def vim_get_current_buffer():
    cur = nvim('bufname("")')
    return cur.replace(os.path.expanduser("~"), "~")


def vim_get_cursor():
    a = nvim('getpos(".")').split(", ")[1]
    b = nvim('getpos("v")').split(", ")[1]

    start = min(a, b)
    stop = max(a, b)
    if start == stop:
        return f"line {start}"
    return f"lines {start} - {stop}"


def get_project_files(project_dir):
    return (
        subprocess.check_output(
            ["git", "ls-files"],
            cwd=project_dir,
        )
        .decode()
        .splitlines()
    )


def get_git_projects_choices():
    gits = subprocess.run(
        [
            "find",
            os.path.expanduser("~"),
            "-maxdepth",
            "2",
            "-type",
            "d",
            "-name",
            ".git",
        ],
        check=False,
        capture_output=True,
        text=True,
    ).stdout.splitlines()
    choices = []
    for git in gits:
        project_dir = os.path.dirname(git)
        project_name = os.path.basename(project_dir)
        choices.append((project_name, project_dir))
    return choices


def cat(file):
    with open(file) as f:
        return f.read()


def submit(
    message,
    history,
    model,
    temperature,
    top_p,
    include_selection,
    include_open_file,
    dont_think,
    project_files,
    project_dir,
    send_context,
):
    # chat_history.append(gr.ChatMessage(role="user", content="asdf"))
    # chat_history.append(dict(role="assistant", content=""))

    env = jinja2.Environment()
    env.filters["cat"] = lambda f: cat(os.path.join(project_dir, os.path.expanduser(f)))
    template = env.from_string(PROMPT_TEMPLATE)
    if send_context:
        prompt = template.render(open_file=vim_get_current_buffer(), **locals())
    else:
        prompt = message + "\nno_think"

    print(prompt)
    from litellm import completion

    response = completion(
        model=model,
        temperature=temperature,
        top_p=top_p,
        messages=history + [{"role": "user", "content": prompt}],
        stream=True,
    )

    resp = ""
    for part in response:
        resp += part.choices[0].delta["content"] or ""
        yield resp


with gr.Blocks() as demo:
    gr.Markdown("# Code Genie 2000")

    with gr.Group(), gr.Accordion("Additional context"):
        with gr.Row():
            project_dropdown = gr.Dropdown(
                ["<select project>"] + get_git_projects_choices(),
                label="Project",
                interactive=True,
            )

            project_files_dropdown = gr.Dropdown(
                ["<select project first>"],
                value=[],
                multiselect=True,
                label="Project files",
                scale=4,
            )

        project_dropdown.change(
            fn=lambda project: gr.Dropdown(choices=get_project_files(project)),
            inputs=project_dropdown,
            outputs=project_files_dropdown,
        )

        # with gr.Accordion("More settings...", open=False):
        with gr.Sidebar(open=False):
            temperature = gr.Slider(
                0, 4, value=0.8, label="Temperature", info="How creative it is"
            )
            top_p = gr.Slider(
                0,
                0.9,
                value=0.8,
                label="Top p",
                info="Higher value for more diverse text.",
            )

        with gr.Row():
            include_open_file = gr.Checkbox()
            gr.Timer(1).tick(
                lambda: gr.Checkbox(label=f"Include `{vim_get_current_buffer()}`"),
                outputs=include_open_file,
            )
            include_selection = gr.Checkbox(label="Include selection")
            gr.Timer(1).tick(
                lambda: gr.Checkbox(label=f"Include {vim_get_cursor()}"),
                outputs=include_selection,
            )
            dont_think = gr.Checkbox(label="/no_think (for qwen)", value=True)

            send_context = gr.Checkbox(label="Send with chat message")

    model = gr.Radio(
        MODELS,
        value="ollama/qwen3:4b",
        show_label=False,
    )

    inputs = [
        model,
        temperature,
        top_p,
        include_selection,
        include_open_file,
        dont_think,
        project_files_dropdown,
        project_dropdown,
        send_context,
    ]

    chatbot = gr.Chatbot(
        allow_tags=True,
        type="messages",
        height="calc(100vh - 500px)",
        resizable=True,
    )
    chat = gr.ChatInterface(
        fn=submit,
        type="messages",
        chatbot=chatbot,
        save_history=True,
        additional_inputs=inputs,
    )

    find_code = gr.Button(value="Find code")

    @gr.render(inputs=chatbot, triggers=[find_code.click])
    def show_code(history):
        # Only do it every 5 tokens to avoid flicker
        for part in reversed(history):
            if part["role"] == "assistant":
                codes = re.findall(FIND_CODE_REGEX, part["content"], re.DOTALL)
                for code in reversed(codes):
                    try:
                        lang, code = code.split("\n", 1)
                    except ValueError:
                        continue
                    fst_line = code.splitlines()[0]
                    if (
                        fst_line.startswith("#")
                        or fst_line.startswith("//")
                        or fst_line.startswith("<!--")
                    ):
                        filename = fst_line.split(" ")[1]
                    else:
                        filename = None

                    with gr.Accordion(filename or "code"):
                        if filename:
                            gr.Button(value="write", size="sm")
                        with gr.Row():
                            with gr.Tab("code"):
                                try:
                                    gr.Code(
                                        code, language=lang, lines=1, container=False
                                    )
                                except ValueError:
                                    gr.Code(code, lines=1, container=False)
                            with gr.Tab("diff"):
                                pass  # TODO


demo.launch()
