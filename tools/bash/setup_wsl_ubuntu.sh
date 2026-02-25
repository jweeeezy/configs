#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export TZ=Europe/Berlin

LOG_PREFIX="Setup Ubuntu Script |"

export SUDO="sudo"
if [ -f "/.dockerenv" ] || [ "${CONTAINER:-}" = "true" ]; then
    export SUDO=""
fi

# Update system packages
echo "$LOG_PREFIX Updating System Packages..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install necessary Linux Tools
echo "$LOG_PREFIX Installing Linux Tools..."
sudo apt-get install -y \
    git \
    make \
    tree \
    direnv \
    ack \
    python3-pip \
    golang-go \
    curl

# Install Configs Repository (Dotfiles, Bash Scripts)
echo "$LOG_PREFIX Installing Config Repository including .dotfiles and Bash scripts..."
git clone https://github.com/jweeeezy/configs.git ~/configs \
    && make install -C ~/configs
# shellcheck source=dotfiles/.bashrc
source ~/.bashrc || true

# Install fzf and add to .bashrc
echo "$LOG_PREFIX Installing Fuzzy Find..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
    ~/.fzf/install --all

# Install Vim PLugins
echo "$LOG_PREFIX Installing Vim Plugin Folder..."
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle \
    && git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

# Generate ssh Key for Github
echo "$LOG_PREFIX Generating SSH Key for Github Authorization..."
mkdir -p ~/.ssh/github/

if [[ -z "${GITHUB_MAIL:-}" ]]; then
    read -rp "$LOG_PREFIX Enter your Github Mail address: " mail_address
    ssh-keygen -t rsa -b 4096 -C "$mail_address" -f ~/.ssh/github/id.rsa
fi

# Install Node Version Manager
echo "$LOG_PREFIX Installing Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts

# Install pipx
echo "$LOG_PREFIX Installing Pipx..."
python3 -m pip install --user pipx
python3 -m pipx ensurepath
# shellcheck source=dotfiles/.bashrc
source ~/.bashrc || true

# Install Ruff + Pylsp
echo "$LOG_PREFIX Installing Pylsp + Ruff Plugin ..."
pipx install python-lsp-server
pipx inject python-lsp-server python-lsp-ruff

# Install bash language server
echo "$LOG_PREFIX Installing Bash Language Server ..."
npm i -g bash-language-server
