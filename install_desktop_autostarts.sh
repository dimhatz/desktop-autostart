#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/desktop-autostart                    # dotfiles directory
olddir=~/desktop-autostart_old             # old dotfiles backup directory
targetdir=~/.config/autostart              # where to place files
#files="bash_profile bashrc dark-term-theme.sh gtkrc-2.0 vim-myplugins vim-notes vimrc Xmodmap Xresources ycm-mybuildcommands no-screensaver.sh"    # list of files/folders to symlink in homedir

files="baloo_file.desktop
cairo-dock.desktop
easystroke.desktop
krunner.desktop
lxqt-notifications.desktop
nm-applet.desktop
plasmashell.desktop
xcape.desktop
xfce4-panel.desktop
xset.desktop"
##########

# create backup dir in homedir
echo "Creating $olddir for backup of any existing files matching those in $dir"
mkdir -p $olddir
echo "...done"

# create dotfiles_old in homedir
echo "Creating $targetdir to place new files from $dir"
mkdir -p $targetdir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Backing up old files and writing new ones"
for file in $files; do
    mv --verbose $targetdir/$file $olddir/
    cp --verbose $dir/$file $targetdir/$file
done
