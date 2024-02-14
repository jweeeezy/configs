# setup ubuntu

### make sure distro is downloading the current versions (otherwise add repo)

    sudo add-apt-repository <link_to_repo>

    sudo apt install vim

#### sudo_log

    sudo vim /etc/sudoers/

- add Defaults logfile="/var/log/sudo.log"

#### make && cmake

    sudo apt install make

    sudo apt install cmake

#### git

    sudo apt install git

    git config --global user.name "Jakob Willert"

    git config --global user.email "willertjakob@gmail.com"

    ssh-keygen -t rsa -b 4096 -C "willertjakob@gmail.com"

    sudo cat ~/.ssh/id_rsa.pub

--> add to GitHub allowed ssh keys

#### bashrc

    git clone git@github.com:jweeeezy/configs.git

    cd configs

    make download

#### cl-tools

    sudo apt install tree

#### personal vim

- add newest vim version

    sudo add-apt-repository ppa:jonathonf/vim

    sudo apt update -y

    sudo apt upgrade -y

    sudo apt install ctags

    sudo apt install ack

    sudo apt install clangd

- add python (at least 3.8)

    sudo apt install python

- add vim plugin manager

    mkdir -p ~/.vim/bundle

    cd ~/.vim/bundle

    git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

- download vim plugins

    vim

    :PluginInstall

- install YCM auto completion plugin with python3.8

    cd ~/.vim/plugged/YouCompleteMe/

    python3 install.py --clangd-completer

#### openssh

    sudo ufw enable

    sudo ufw add 4242

    sudo apt install openssh-server

    sudo vim /etc/ssh/sshd_config (uncomment #Port 4242)

#### docker

    sudo apt install docker

    sudo systemctl start docker

    sudo systemctl enable docker

# vim setup guides
https://dane-bulat.medium.com/how-to-turn-vim-into-a-lightweight-ide-6185e0f47b79
https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1
