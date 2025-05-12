# My dotfiles

This is my directory that contains the dotfiles for my system

## Requirements

```bash
# for zsh
sudo apt install zsh 

# install oh my zsh for managing zsh shell configuration 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh history substring search
git clone https://github.com/zsh-users/zsh-history-substring-search.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```


Ensure you have the following installed on your system
