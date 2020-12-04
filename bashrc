# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#change the shell promt
#	encapsulate non-printing characters inside '\[' and '\]'
#	\e[1m means *bold* typing. \e[0m means "normal" typing
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF --color'
alias la='ls -AlF --color'
alias lt='ls -AlFtr --color'
alias l='ls -ACF --color'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ---------- Self Written ----------
#environment variables
export SCREENDIR=$HOME/.screen
export PLANTUMLPATH=$HOME/Downloads/Apps/plantuml/plantuml.jar
export UMLDOCLET1PATH=$HOME/Downloads/Apps/umldoclet/umldoclet-1.1.4/umldoclet-1.1.4.jar
export UMLDOCLET2PATH=$HOME/Downloads/Apps/umldoclet/umldoclet-2.0.12/umldoclet-2.0.12.jar
export PATH=$HOME/Downloads/Apps/apache-maven-3.6.3/bin:$PATH
export GUINAN=ikr_guinan@ugemkow.de

#functions {{{
#exec file in a different directory
execute_under_directory()
{
	if [ $# -lt 2 ] 
	then
		echo "usage: execute_under_directory <DIRECTORY_PATH> <COMMAND>"
		return 1
	fi

	local current_directory=$(pwd)
	cd $1

	shift
	"$@"

	cd $current_directory
}

show_path()
{
	readlink -e $1
	if [ $? -eq 1 ]; then
		echo "Cannot resolve path '$(realpath $1)'"	
	fi
}

#write the extract skript here
extract () 
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1    ;;
			*.tar.gz)	tar xvzf $1    ;;
			*.bz2)		bunzip2 $1	   ;;
			*.rar)		unrar x $1	   ;;
			*.gz)		gunzip $1	   ;;
			*.tar)		tar xvf $1	   ;;
			*.tbz2)		tar xvjf $1    ;;
			*.tgz)		tar xvzf $1    ;;
			*.zip)		unzip $1	   ;;
			*.Z)		uncompress $1  ;;
			*.7z)		7z x $1		   ;;
			*)			echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
fi
}

psp ()
{
	ps -o pid,ppid,tty,user,etime,pri,nice,vsize,rss,s,%cpu,%mem,cputime,wchan,command -p $1	
}

convert_pdf_to_greyscale()
{
	gs  -sOutputFile=$2  \
	-sDEVICE=pdfwrite  \
	-sColorConversionStrategy=Gray  \
	-dProcessColorModel=/DeviceGray  \
	-dCompatibilityLevel=1.4  \
	-dNOPAUSE  \
	-dBATCH  $1
}

open_random_file_with_vim()
{
	if [ $# -gt 1 ] 
	then
		echo "usage: open_random_file_with_vim [<FILE_PATTERN>]"
		return 1
	elif [ $# -eq 1 ]
	then
		vim $(ls | grep $1 | sort -R | tail -1)
	else
		vim $(ls | sort -R | tail -1)
	fi
}

open_file_on_vimserver()
{
	if [ $# -ne 1 ] 
	then
		echo "usage: open_file_on_vimserver [<FILE_PATH>]"
		return 1
	fi
	vim --remote $1
	#open vim instance
	fg
}

compare_directory_status()
{
	local findstart="-regextype posix-extended"
	local findend="-printf '%M %P\n'"
	local findparams=""
	local POSITIONAL=()
	local MODE=""
	local excludedirs=""
	while [[ $# -gt 0 ]]
	do
		key="$1"

		case $key in
			-s|--store)
				MODE="store"
				shift # past argument
				;;
			-d|--diff)
				MODE="diff"
				shift # past argument
				#do the work here and leave
				local findcom=$(cat ~/.util/ds/.find_command.sh)

				eval "$findcom" > ~/.util/ds/find_diff.txt
				diff -u ~/.util/ds/find.txt ~/.util/ds/find_diff.txt
				
				return $?
				;;
			-x|--max-depth)
				maxdepth="$2"
				findparams="$findparams -maxdepth $2"
				shift # past argument
				shift # past value
				;;
			-e|--exclude)
				excludedirs=$2
				findparams="$findparams ! -regex '.*/$excludedirs/?(/.*)?'"
				shift # past argument
				shift # past value
				;;
			-h|--exclude-hidden)
				findparams="$findparams ! -regex '.*/\..*'"
				shift # past value
				;;
			--default)
				DEFAULT=YES
				shift # past argument
				;;
			*)
				POSITIONAL+=("$1") # save it in an array for later
				shift # past argument
				;;
		esac
	done
	set -- "${POSITIONAL[@]}" # restore positional parameters
	
	findparams="$findstart $findparams $findend"
	echo "executing: find $findparams"
	echo "find $findparams" > ~/.util/ds/.find_command.sh

	if [[ -n $1 ]]; then
		echo "Last line of file specified as non-opt/last argument:"
		tail -1 "$1"
	fi  
	
	if [[ $MODE == "store" ]]
	then
		eval "find $findparams" > ~/.util/ds/find.txt
	else
		eval "find $findparams"
	fi
}

#functions end }}}

alias ..='cd ..'
alias bashhelp='vim ~/configfiles/bashhelp.sh'
alias githelp='vim ~/configfiles/githelp.sh'
alias severalhelp='vim ~/configfiles/severalhelp.sh'
alias pumlhelp='vim ~/configfiles/pumlhelp.sh'
alias tophelp='vim ~/configfiles/tophelp'
alias mutthelp='vim ~/configfiles/mutthelp.sh'
alias vimhelp='vim ~/configfiles/vimhelp.vim'
alias eud='execute_under_directory'
alias gitlog='git log --graph --oneline --decorate --all'
alias fpwd='show_path'
alias pdf2bw='convert_pdf_to_greyscale'
alias watch05d='watch --color -n 0.5 -d'
alias pu='java -jar $PLANTUMLPATH'
alias ru='xdg-open'
alias ds='compare_directory_status -s'
alias dsd='compare_directory_status -d'
alias findx='compare_directory_status'
alias jupynote='python3 -c "from notebook.notebookapp import main; main()"' 

alias v='vim'
alias vr='vim -M'
alias vran='open_random_file_with_vim'
alias vserv='vim --servername VIM'
alias vrem='open_file_on_vimserver'

#deactivate linux freeze with <C-s>
if [[ -t 0 && $- = *i* ]] 
then
	stty -ixon
fi

source ~/.bashrc_machine_specific

