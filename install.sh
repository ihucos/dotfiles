set -e

DOTFILES_REPO="https://github.com/ihucos/dotfiles.git"

echo "==> Detecting package manager and installing system packages..."

if command -v apk &> /dev/null; then
    # Alpine Linux
    sudo apk add --no-cache git curl bash neovim stow build-base
elif command -v apt-get &> /dev/null; then
    # Debian / Ubuntu / Mint
    sudo apt-get update
    sudo apt-get install -y git curl bash neovim stow build-essential
elif command -v pacman &> /dev/null; then
    # Arch Linux / Manjaro
    sudo pacman -Syu --noconfirm git curl bash neovim stow base-devel
elif command -v dnf &> /dev/null; then
    # Fedora / RHEL
    sudo dnf install -y git curl bash neovim stow make automake gcc gcc-c++ kernel-devel
elif command -v brew &> /dev/null; then
    # macOS (Homebrew)
    brew install git curl bash neovim stow
else
    echo "Error: No supported package manager found (apk, apt, pacman, dnf, brew)." >&2
    exit 1
fi

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
