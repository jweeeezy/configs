# Linux Tool Setup (Ubuntu)

## Vim

### Get latest Vim

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update -y && sudo apt-get upgrade -y
```
### Add Vim Plugin Manager

```
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
vim +PluginInstall +qall
```

## SSH

## SSH Key for GitHub

```
export GITHUB_MAIL="your-mail-address"
git config --global user.name $(echo $GITHUB_MAIL)
git config --global user.email $(echo $GITHUB_MAIL)
ssh-keygen -t rsa -b 4096 -C $(echo $GITHUB_MAIL)
cat ~/.ssh/id_rsa.pub
```
## Allow SSH Connection in Firewall

```
sudo ufw enable
sudo ufw allow ssh
```
--> enable Port 22 (  /etc/ssh/sshd_config  )

## Docker


### Get latest Docker

https://docs.docker.com/engine/install/ubuntu/

```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install ca-certificates 
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

#### Docker to sudo

Security Concern, good for developing

https://docs.docker.com/engine/install/linux-postinstall/

```
sudo groupadd docker
sudo usermod -aG docker $USER
```
log in and out to experience changes

## Fuzzy Find

### Install CLI

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
