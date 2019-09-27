# Git bare repo

This contains all of the .config files for a successful copy of the computer

TL:DR;

Creating

``````
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' (add this alias to .zshrc or .bashrc)
bash
config config --local status.showUntrackedFiles no

``````
## Usage

``````

config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
``````

How to install Emacs: http://tipsonubuntu.com/2019/06/09/install-emacs-26-2-keep-updated-via-snap-ubuntu-18-04-higher/ 
Learn Emacs: https://www.youtube.com/watch?v=Iagbv974GlQ&t=28s
Mac Setup guide: https://sourabhbajaj.com/mac-setup/

### Swap CAPS with ESC

Put this in your ~/.Xmodmap file:
```
remove Lock = Caps_Lock
remove Control = Escape
keysym Escape = Caps_Lock
keysym Caps_Lock = Escape
add Lock = Caps_Lock
add Control = Escape
```
Then run xmodmap ~/.Xmodmap

### Installing ZSH and seting the terminal

https://github.com/robbyrussell/oh-my-zsh
http://www.boekhoff.info/how-to-install-zsh-and-oh-my-zsh/


## Migrating configuration/dotfiles to a new system

If you already store your configurations/dotfiles in a Git repo, on a new system can be migrated with the following steps:
Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

```
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

Downloading into a new system, not tried yet

``````
If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

    Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

    And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

echo "dotfiles" >> .gitignore

    Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

git clone --bare <git-repo-url> $HOME/dotfiles

    Define the alias in the current shell scope:

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

    Checkout the actual content from the bare repository to your $HOME:

config checkout

    The step above might fail with a message like:

error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting

This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

    Re-run the check out if you had problems:

config checkout

    Set the flag showUntrackedFiles to no on this specific (local) repository:

config config --local status.showUntrackedFiles no

    You're done, from now on you can now type config commands to add and update your dotfiles:

config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push

Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script, store it as Bitbucket snippet like I did, create a short url for it and call it like this:

curl -Lks http://bit.do/cfg-install | /bin/bash

For completeness this is what I ended up with (tested on many freshly minted Alpine Linux containers to test it out):

git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no



Original article with setting into a new place
https://www.atlassian.com/git/tutorials/dotfiles

https://www.youtube.com/watch?v=tBoLDpTWVOM

## Properly install Python 

https://packaging.python.org/tutorials/installing-packages/#ensure-pip-setuptools-and-wheel-are-up-to-date

## Properly installing PIP


Solve problems installing pip ource /usr/local/lib/python3.6/dist-packages/virtualenv.pp y
shttps://www.linuxhelp.com/how-to-install-pip-on-linuxmint-18-3
https://packaging.python.org/guides/installing-using-linux-tools/

## Install .dotnet
terminal
```````
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
`````

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-3.0

https://dotnet.microsoft.com/download/linux-package-manager/ubuntu19-04/sdk-current


### installing Node with NVM

https://github.com/nvm-sh/nvm


### installing python

https://docs.python-guide.org/starting/install3/linux/#install3-linux

https://linuxize.com/post/how-to-install-pip-on-ubuntu-18.04/
sudo apt install python3-pip
