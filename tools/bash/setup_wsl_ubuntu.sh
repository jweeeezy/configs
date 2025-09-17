#!/usr/bin/env bash

# Update system packages
echo "Updating System Packages..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install necessary Linux Tools
echo "Installing Linux Tools..."
sudo apt-get install -y \
    git \
    make \
    tree \
    direnv \
    ack \
    python3-pip \
    golang-go

# Install Configs Repository (Dotfiles, Bash Scripts)
echo "Installing Config Repository including .dotfiles and Bash scripts..."
git clone https://github.com/jweeeezy/configs.git ~/configs \
    && make install -C ~/configs
# shellcheck source=dotfiles/.bashrc
source ~/.bashrc || true

# Install fzf and add to .bashrc
echo "Installing Fuzzy Find..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
    ~/.fzf/install --all

# Install Vim PLugins
echo "Installing Vim Plugin Folder..."
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle \
    && git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

# Generate ssh Key for Github
echo "Generating SSH Key for Github Authorization..."
mkdir -p ~/.ssh/github/
read -rp "Enter your Github Mail address: " mail_address
ssh-keygen -t rsa -b 4096 -C "$mail_address" -f ~/.ssh/github

# Install Node Version Manager
echo "Installing Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts

# Install pipx
echo "Installing Pipx..."
python3 -m pip install --user pipx
python3 -m pipx ensurepath
# shellcheck source=dotfiles/.bashrc
source ~/.bashrc || true

# Install Ruff + Pylsp
echo "Installing Pylsp + Ruff Plugin ..."
pipx install python-lsp-server
pipx inject python-lsp-server python-lsp-ruff

# Install bash language server
echo "Installing Bash Language Server ..."
npm i -g bash-language-server
