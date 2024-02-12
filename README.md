# setup lightweight ubuntu server (18.04)
## install vim
sudo apt install vim

## add ssh connectivity
sudo ufw enable
sudo ufw add 4242
sudo apt install openssh-server
sudo vim /etc/ssh/sshd_config (uncomment #Port 4242)

## add git / setup git key / download configs repo
ssh-keygen -t rsa -b 4096 -C “willertjakob@gmail.com”
sudo cat ~/.ssh/id_rsa.pub (—> add to GitHub allowed ssh keys)
sudo apt install git

#setup make for configs folder
sudo apt install make

## setup personal vim
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8
sudo apt install cmake (needs newest version)
https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line

sudo apt-get install g++-8
CC=gcc-8 CXX=g++-8 python3 ./install.py
python3.8 install.py --clangd-completer

## setup docker
get newest docker version (update repo)
https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04
sudo systemctl start docker
sudo systemctl enable docker

# vim setup guides

https://dane-bulat.medium.com/how-to-turn-vim-into-a-lightweight-ide-6185e0f47b79

https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1

# needed for vim plugins:

PYTHON3
CTAGS
ACK
LLVM         (brew install llvm)
CLANGD
CLANG-FORMAT (brew install clang-format)

bundle directory in vim folder
```
mkdir -p ~/.vim/bundle
```
```
cd ~/.vim/bundle
```
```
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
```

Download all plugins in vim

``` :PluginInstall ```

inside YouCompleteMe directory
```
python3 install.py --clangd-completer
```

# installed on school macs

```
getbrew
(zsh alias)
```

```
brew install tree
```

```
brew install ack
```

```
brew install ctags
```

```
brew install vim
```

# installed on ubuntu

Update vim (add dependency)
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get install vim
```

Git
```
sudo apt-get install git
```

Tree
```
sudo apt-get install tree
```

CTAGS
```
sudo apt-get install exuberant-ctags
```

XCLIP
```
sudo apt install xclip
```

ACK
```
sudo apt-get install ack
```

PYTHON3-DEV
```
sudo apt-get install python3-dev
```

CMAKE
```
sudo apt-get install cmake
```

MAKE
```
sudo apt-get install make
```
