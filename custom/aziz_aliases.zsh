# apply changes made to the zsh config
alias s="source ~/.zshrc && echo \"$fg[green]Sourced ~/.zshrc$fg[default]\""

# Switch to the default (complex) prompt
alias dp="unset az_prompt_type; s ; clear"

# Switch to the simple prompt
alias sp="export az_prompt_type='simple' ; s ; clear"

# Replace the sudo prompt and add some color to it
alias sudo="sudo -p \"$fg_bold[red][sudo] Password:$fg[default]\" "

# Edit zsh/oh-my-zsh config files in the default editor
alias ez='$VISUAL $ZSH'
alias erc='$EDITOR $HOME/.zshrc'
alias ezrc='$VISUAL $HOME/.zshrc && $EDITOR $ZSH'
alias cz='c $ZSH'

# rm, cp, mv, mkdir, etc <- regular stuff override
if [[ $OSTYPE[1,6] == 'darwin' ]]; then
  alias ls="CLICOLOR_FORCE=1 ls -FG"
fi
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -vp"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias cal="cal -m"
alias df="df -h"
alias du="du -h -c | egrep 'total'"

# in linux, ack is actually ack-grep
# if [[ $OSTYPE[1,6] == 'linux-' ]]; then
#   alias ack="ack-grep"
# fi

# batch renamer.
# ie: Files: foo-1.txt foo-2.txt foo-3.txt 
#       mmv foo-*.txt bar-*.txt
#     New files: bar-1.txt bar-2.txt bar-3.txt
# Taken from the zsh-templates-osx project (http://code.google.com/p/zsh-templates-osx/)
# More info here:
# http://xanana.ucsc.edu/~wgscott/xtal/wiki/index.php/Explanations_for_each_zsh_template_file#030_functions.distributed.zsh
alias mmv='noglob zmv -W'

# ls
alias l="ls -1"
alias la="ls -1A"
alias ll="ls -lh"
alias ls.='ls -d .[^.]*'  # list hidden files only
alias l.='ls -1 -d .[^.]*'  # list hidden files only
# alias l.="ls -Ad .*" # alternative to the alias above
alias ll.='ll -h -d .[^.]*' # list hidden files only
alias "l*"="ls *"

# the two aliases below were taken from https://github.com/jqr/dotfiles/blob/master/bash_profile.d/standard_improvements.sh
alias recent='ls -lAt | head'
alias old='ls -lAt | tail'


# grep
alias -g "?"="| grep"
alias -g "e?"="| egrep"
alias -g "f?"="| fgrep"
alias fa="alias ? $1" # find an alias

# cd
alias .="p"
alias -- -="c -"

# which
alias wi="which"
alias wia="which -a"

# dir shortcuts
alias www="c ~/Sites"
alias cs="c ~/Sources"
alias csgit="c ~/Sources/git"
alias cb="~/Sources/aziz/git/azizlight.github.com"

# pbcopy aliases
if [[ $OSTYPE[1,6] == 'darwin' ]]; then
  # Copy ssh key to the clipboard
  alias ss="cat ~/.ssh/id_rsa.pub|pbcopy"

  # copy the path to the current folder to the clipboard
  alias pc="builtin pwd|tr -d '\n'|pbcopy"
elif [[ $OSTYPE[1,6] == 'linux-' ]]; then
  # Copy ssh key to the clipboard
  alias ss="cat ~/.ssh/id_rsa.pub|xclip -i"

  # copy the path to the current folder to the clipboard
  alias pc="builtin pwd|tr -d '\n'|xclip -i"
fi

# make file(s) executable
alias x="chmod a+x"

# which
alias wh="builtin which"

# Find out if a mysql server is running and show info about it
alias find-mysql="netstat -ln | grep mysql"

# History
alias h="history"

# less
alias -g ":l"=" | less -R"

# most
alias -g ":m"="|most"

# Ping
alias ping="ping -c 5"
alias google="ping www.google.com"

# make tree a little cooler looking.
alias tree="tree -CAFa -I 'rhel.*.*.package|.git' --dirsfirst"

# convert string to uppercase
alias -g ":upper"=" | tr \"[:lower:]\" \"[:upper:]\""
# convert string to lowercase
alias -g ":lower"=" | tr \"[:upper:]\" \"[:lower:]\""

# -------
# - PHP -
# -------

# This is kind of a hack to force MAMP's php to take precedence over OS X's and
# to force php cli to use the same php.ini config file as the active php
alias php="/Applications/MAMP/bin/php5.2/bin/php --php-ini /Library/Application\ Support/appsolute/MAMP\ PRO/conf/php.ini"

# Validate PHP from the Command Line
alias vp="php -v && php -d display_errors=on"

# ------------
# - CLI APPS -
# ------------

# jekyll
alias jk="jekyll"
alias jks="jekyll --server"

# Homesick dotfiles
alias c.="c ~/.homesick/repos/"
alias s.="homesick symlink .aziz && homesick symlink .dotfiles"

# Get ip address
alias ip="curl ifconfig.me"
