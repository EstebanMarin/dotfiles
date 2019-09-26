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

Downloading into a new system, not tried yet

``````
If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

    Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

echo ".cfg" >> .gitignore

    Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

git clone --bare <git-repo-url> $HOME/.cfg

    Define the alias in the current shell scope:

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
