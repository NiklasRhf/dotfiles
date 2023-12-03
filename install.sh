#!/bin/bash

# Update package database
sudo pacman -Syu
eos-welcome --disable

# List of packages to install
packages=(
    alacritty
    neovim
    tmux
    powerline
    powerline-fonts
    ripgrep
    git
    stow
    zsh
    eza
    picom
    nodejs
    npm
)

# Install packages
for pkg in "${packages[@]}"; do
    echo "Installing $pkg..."
    sudo pacman -S --noconfirm $pkg
done

yay -S --noconfirm --needed brave-bin
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

echo "Installation complete."

# Download dotfiles
git clone https://github.com/NiklasRhf/dotfiles.git

rm -rf ~/.config/i3
rm ~/.bashrc
rm ~/.zshrc

# Link dotfiles
cd dotfiles && stow --ignore='\.sh$' */

# Restart i3
i3-msg restart

# Download and install font

font_name="Hack"
font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip"
download_dir="$HOME/Downloads"
install_dir="/usr/share/fonts/TTF"
mkdir -p "$download_dir"
wget -O "$download_dir/$font_name.zip" "$font_url"
sudo mkdir -p "$install_dir"
sudo unzip -o "$download_dir/$font_name.zip" '*.ttf' -d "$install_dir"
echo "Refreshing font cache..."
fc-cache -fv

echo "$font_name installation complete."

# Change the default shell to zsh
echo "Changing the default shell to zsh..."
chsh -s "$(which zsh)"
