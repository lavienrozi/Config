#!/bin/bash
echo "starting..."
# Update package lists
sudo apt update

# Install ZSH
# sudo apt install -y zsh
if command -v zsh >/dev/null 2>&1; then
    echo "Zsh is installed, upgrading..."
    sudo apt update && sudo apt upgrade zsh
else
    echo "Zsh is not installed."
    sudo apt install -y zsh
fi

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Set ZSH as your default shell
chsh -s $(which zsh)

# Fetch the custom theme from GitHub. `/lavienrozi` and `Config/main/zsh/asuka.zsh-theme`
# and write the raw into the asuka.zsh-theme
wget https://raw.githubusercontent.com/lavienrozi/Config/main/zsh/asuka.zsh-theme -O $HOME/.oh-my-zsh/themes/asuka.zsh-theme

# Change the theme in the .zshrc file
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="asuka"/g' $HOME/.zshrc

# Source the .zshrc file to apply changes, don't forget to restart the shell
source $HOME/.zshrc
