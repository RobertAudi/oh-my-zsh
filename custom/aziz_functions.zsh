# pwd with style
p () {
	print -P "You are in: %F{cyan}%K{blue}$PWD%f%k\n"
}

# Copy the path to a file (including the filename)
pcf () {
  echo "$PWD/$1" | pbcopy 
}

# show in which dir I am after a cd
c () {
	builtin cd "$@" &&
	p &&
	ls -AGF
}

# Make a new dir and move in it
mk () {
	command mkdir -p $* &&
	echo "\n\tFolders created: $fg[green]${*}$fg[default]\n"
}

# Make a new dir and move in it
mkcd () {
	command mkdir -p $1 &&
	echo "\n\tFolders created: $fg[green]${1}$fg[default]" &&
	builtin cd $1 &&
	echo "\nMoved to: $fg[blue]$bg[blue]`pwd`$fg[default]$bg[default]\n"
}

# rm -rf with nice feedback
rf () {
	echo "\n\t$fg[red]Permanently removing ${*}...$fg[default]\n" &&
	command rm -rf $* &&
	echo "\n\t$fg[yellow]Items deleted: ${*}\n"
}

# cp -R with nice feedback
cr () {
	echo "\n\t$fg[yellow]Copying...\n" &&
	command cp -R $* &&
	echo "\n\t$fg[green]Items copied successfully!!$fg[default]\n"
}

# Download a file with curl
get () {
	builtin cd ~/Downloads &&
	curl -O $1 &&
	echo "\nDownload Complete : ${1}\n" &&
	builtin cd $OLDPWD
}

# Fewer keystrokes to search man page of command
mg (){ man ${1} | egrep ${2} | more; }

# A function that allows you to perform a case-insensitive search in
# the current directory, and directories in the current directory (but no further),
# for files containing the first argument anywhere in their names.
# TODO: Customize this function so that the user can easily choose the depth
quickfind () { find . -maxdepth 4 -iname "*$1*" }

# Create a zip archive
z () {
	zip -r $1 $1
}

# Convert a markdown file in an HTML file
markdown () { 
	/Applications/TextMate.app/Contents/SharedSupport/Support/bin/Markdown.pl $1 > $1.html
}

# look up a word
dict () {
	curl -s dict://dict.org/d:$1 | perl -ne 's/\r//; last if /^\.$/; print if /^151/../^250/' | more
}
lsdict () {
	grep "$@" /usr/share/dict/words
}

# Create a backup of the file/folder passed as parameter and log the backup in the backup folder
bak () {
	date_time=`date +"%F_%H-%M-%S"`
	bak_dir=$HOME"/.my.backups/${1}.bak"
	dir=$bak_dir'/'${date_time}
	
	command mkdir -p $dir
	command cp -R $1 $dir
	
	# Log 1
	if [ ! -e $HOME"/.my.backups/backups.log" ]
	then
		touch $HOME"/.my.backups/backups.log" &&
		echo "Backups log\n(Arranged by backup date)\n" >> $HOME"/.my.backups/backups.log"
	fi
	echo "${date_time} :\t${dir}\t->\t`pwd`/${1}" >> $HOME"/.my.backups/backups.log"
	
	# Log 2
	if [ ! -e $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER" ]
	then
		touch $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER" &&
		echo "This file contains the path the original file/folder for each backup\n(Arranged by backup date)\n" >> $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER"
	fi
	echo "${date_time} :\t`pwd`/${1}" >> $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER"
	
	# Feedback
	echo "\n\t$fg[green]Backup Complete$fg[default]\n"
}

# Less radical alternative to the function above
# Taken from: http://github.com/rtomayko/dotfiles/blob/rtomayko/bin/orig
orig ()
{
    if [ $# = 0 ] ; then
        echo "usage: orig FILE ..."
        echo "copy FILE(s) to FILE.orig"
    else
        for f in "$@" ; do
            cp -p "$f" "$f.orig"
        done
    fi
}

# return the length of the string passed as argument
count () {
	echo ${#1}
}

# Extract about anything
# Note: Only works with one file!
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf   $1 ;;
			*.tar.gz)    tar xvzf   $1 ;;
			*.bz2)       bunzip2    $1 ;;
			*.rar)       unrar x    $1 ;;
			*.gz)        gunzip     $1 ;;
			*.tar)       tar xvf    $1 ;;
			*.tbz2)      tar xvjf   $1 ;;
			*.tgz)       tar xvzf   $1 ;;
			*.zip)       unzip      $1 ;;
			*.Z)         uncompress $1 ;;
			*.7z)        7z x       $1 ;;
			*)           echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# git hub wrapper...
git () {
	hub "$@"
}

# Display the Internal and External IPs
getip () {
	echo -n "Internal IP: "
	ifconfig en1 | awk '/inet /&&!/127.0.0.1/{sub(/^[^:]+:/,"",$2); print $2}'
	echo -n "External IP: "
	curl icanhazip.com
}

# List all available zsh colors
showcolors () {
	print -l ${(k)fg}
}

# List & display all 256 colors
showcolors256 () {
	for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done
}

# Fortune Cookie
fortuneCookie() {
  # List of cow files available. The are 46 elements in the array.
  # The is probably a way to make this array dynamic,
  # but I don't have the patience or the time to find out how
  # Just in case, run `cowsay -l` and verify that you have all the cowfiles,
  #  else, replace the contents of the array with you cow files list.
  cowFiles=('beavis.zen' 'bong' 'bud-frogs' 'bunny' 'cheese' 'cower' 'daemon' 'default' 'dragon' 'dragon-and-cow' 'elephant' 'elephant-in-snake' 'eyes' 'flaming-sheep' 'ghostbusters' ''head-in'' 'hellokitty' 'kiss' 'kitty' 'koala' 'kosh' 'luke-koala' 'meow' 'milk' 'moofasa' 'moose' 'mutilated' 'ren' 'satanic' 'sheep' 'skeleton' 'small' 'sodomized' 'stegosaurus' 'stimpy' 'supermilker' 'surgery' 'telebears' 'three-eyes' 'turkey' 'turtle' 'tux' 'udder' 'vader' 'vader-koala' 'www');
  
  # Pick a random cow file
  cowFileIndex=$[ ( $RANDOM % 46 )  + 1 ]
  cowFile=${cowFiles[$cowFileIndex]}
  
  # Toilet filters
  toiletFilters=('--gay' '--metal')
  
  # Pick a random toilet filter
  toiletFilterIndex=$[ ( $RANDOM % 2 )  + 1 ]
  toiletFilter=${toiletFilters[$toiletFilterIndex]}
  
  fortune | cowsay -f $cowFile | toilet $toiletFilter -f term
}

# Usage: pls [<var>]
# List path entries of PATH or environment variable <var>.
# Taken from http://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc
lspath () { eval echo \$${1:-PATH} |tr : '\n'; }

# function that enables things like 'cd .../dir'
# ... gets replaced by ../.. automatically
# then every additional . gets replaced by /..
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot