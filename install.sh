set -e

DOTFILES_REPO="https://github.com/ihucos/dotfiles.git"

echo "==> Installing on alpine..."

apk add --no-cache git curl bash neovim stow build-base py3-psutil py3-pip
pip3 install --no-build-isolation --break-system-packages neovim-remote 


echo "==> Cloning dotfiles..."
if [ -d "$HOME/.dotfiles" ]; then
    echo "Directory ~/.dotfiles already exists. Skipping clone."
else
    git clone "$DOTFILES_REPO" "$HOME/.dotfiles"
fi

echo "==> Stowing all..."
cd "$HOME/.dotfiles"
stow --dotfiles --verbose 2 .

echo "==> Setting up vim-plug..."
mkdir -p "$HOME/.config/nvim/autoload" "$HOME/.local/share/nvim/site/autoload"
curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "==> Installing Neovim plugins via PlugInstall..."
nvim +PlugInstall +qall || true

echo "==> Setup complete! Starting editor/shell..."
