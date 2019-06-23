#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables
startdir=$(pwd)
dir=$HOME/dotfiles                    # dotfiles directory
backup_dir=$HOME/dotfiles_old             # old dotfiles backup directory
fonts_src=$dir/fonts			  # font directory
fonts_dest=$HOME/.local/share/fonts
files="xinitrc Xresources vimrc zshrc xprofile"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
if [[ ! -e $backup_dir ]]; then
	echo "Creating backup directory $backup_dir for backup of any existing dotfiles in ~"
	mkdir -p "$backup_dir"
	echo "...done"
elif [[ ! -d $backup_dir ]]; then
	echo "$backup_dir already exists but is not a directory" 1>&2
	exit 1
fi

# change to the dotfiles directory
if [[ $(pwd) != "$dir" ]]; then
	echo "Changing to the $dir directory"
	cd "$dir" || exit 2
	echo "...done"
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
	if [[ -e ~/.$file ]]; then
		echo "$file exists in $HOME, moving it to $backup_dir"
		mv ~/.$file $backup_dir
	fi
	echo "Creating symlink from $file to .$file in home directory."
	ln -s $dir/$file ~/.$file
done

echo "Changing to the config directory"
cd config || exit 2
echo "...done"

for folder in *; do
	[[ -f $folder ]] && continue
	if [[ -e ~/.config/$folder ]]; then
		echo "$folder exists in $HOME/.config, moving it to $backup_dir"
		mv ~/.config/$folder $backup_dir
	fi
	echo "Creating symlink to $folder in $HOME/.config directory."
	ln -s $dir/config/$folder ~/.config/$folder
done

echo "Symlinking doom.d"
# if [[ ! -e $HOME/.doom.d ]]; then
# 	echo "Creating dir ~/.doom.d"
# 	mkdir -p ~/.doom.d
# 	echo "...done"
# fi
if [[ -e $HOME/.doom.d ]]; then
	echo "~/.doom.d exists, moving it to backup dir"
	mv $HOME/.doom.d $backup_dir
fi
ln -s $dir/doom.d $HOME/.doom.d
# cd $dir/doom.d
# for file in *; do
# 	ln -s $dir/doom.d/$file ~/.doom.d/$file
# done

# install fonts locally
if [[ ! -e $HOME/.local/share/fonts ]]; then
	echo "Creating dir $fonts_dest"
	mkdir -p "$fonts_dest"
	echo "...done"
fi

echo "Copying fonts to $fonts_dest"
cp -r -n $fonts_src/* "$fonts_dest"
echo "...done"
echo "Running fc-cache"
fc-cache
echo "...done"

echo "Changing back to $startdir directory"
cd "$startdir" || exit 2
echo "...done"
