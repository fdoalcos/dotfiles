#!/bin/bash

echo "Installing Francis's configuration system"

# if one fails then all fails
set -e

OS="$(uname)"

# Check its OS to handle in its own OS system
if [[ "$OS" == "Darwin" ]]; then
	echo "Detected macOS"
	
	if ! command -v brew &> /dev/null; then
		echo "Installing homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi	

	echo "installing stow"
	brew install stow
elif [[ "$OS" == "Linux" ]]; then
	echo "Detected Linux"
	echo "installing stow"
	sudo apt update
	sudo apt install stow
else 
	echo "Unsupported OS: $OS"
	exit 1
fi

# Install oh-my-zsh if still not fix
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "Installing oh my zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# For custom plugin directory
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Clone plugins
echo "Cloning zsh plugins"
git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/plugins/zsh-history-substring-search"

# Symlinking to your dotfiles
echo "Linking dotfiles using stow"
cd "$HOME/.dotfiles"
stow .
