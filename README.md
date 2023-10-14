# guides

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

inside YouCompleteMe directory
```
python3 installer.py --clangd-completer
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

CMAKE
```
sudo apt-get install cmake
```

MAKE
```
sudo apt-get install make
```
