# packages needed for the usage of this dotfiles repo
# this config script is only tested for Ubuntu

sudo apt update && sudo apt upgrade -y
sudo apt git stow install ripgrep feh polybar i3 rofi zathura picom zsh tmux batcat vim -y

# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# alacritty
cargo install alacritty

# yazi
cargo install --locked yazi-fm yazi-cli

# omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

