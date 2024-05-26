# Setting up a unix (in this case linux ubuntu/debian) os 

## Essentials

```
sudo add-apt-repository ppa:jonathonf/vim
```
```
sudo apt-get update -y && sudo apt-get upgrade -y
```
```
sudo apt-get install -y \
software-properties-common \
git \
make \
cmake \
clang \
clangd \
clang-format \
ctags \
ack \
python3-dev \
openssh-server \
tree \
grip
```
```
git config --global user.name "Jakob Willert"
```
```
git config --global user.email "willertjakob@gmail.com"
```
```
ssh-keygen -t rsa -b 4096 -C "willertjakob@gmail.com"
```
```
cat ~/.ssh/id_rsa.pub
```
--> add to GitHub allowed SSH keys
```
git clone https://github.com/jweeeezy/configs.git ~/configs \
&& make download -C ~/configs `
```

```
sudo ufw enable
```
```
sudo ufw add ssh
```
--> enable Port 22 (  /etc/ssh/sshd_config  )

## Optional

### Vim Setup Guides
https://dane-bulat.medium.com/how-to-turn-vim-into-a-lightweight-ide-6185e0f47b79
https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1

```
mkdir -p ~/.vim/bundle
```
```
cd ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
```
```
vim +PluginInstall +qall
```
```
cd ~/.vim/plugged/YouCompleteMe && python3 install.py --clangd-completer --ts-completer
```

### Docker
https://docs.docker.com/engine/install/ubuntu/

```
` for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done `
```
```
sudo apt-get update
```
```
sudo apt-get install ca-certificates curl
```
```
sudo install -m 0755 -d /etc/apt/keyrings
```
```
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
```
```
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
 
``` 
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
```
sudo apt-get update -y
```
