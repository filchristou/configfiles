# # ~/.bashrc: executed by bash(1) for non-login shells.
# # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# # for examples
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
#
# # don't put duplicate lines or lines starting with space in the history.
# # See bash(1) for more options
# HISTCONTROL=ignoreboth
#
# # append to the history file, don't overwrite it
# shopt -s histappend
#
# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000
#
# # check the window size after each command and, if necessary,
# # update the values of LINES and COLUMNS.
# shopt -s checkwinsize
#
# # If set, the pattern "**" used in a pathname expansion context will
# # match all files and zero or more directories and subdirectories.
# #shopt -s globstar
#
# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi
#
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
#
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
#
# #change the shell promt
# #	encapsulate non-printing characters inside '\[' and '\]'
# #	\e[1m means *bold* typing. \e[0m means "normal" typing
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# # some more ls aliases
# alias ll='ls -alF --color'
# alias la='ls -AlF --color'
# alias lt='ls -AlFtr --color'
# alias l='ls -ACF --color'
# alias lh='ls -ld .?* --color'
# alias lst='ls | sort -k 1.7,1.8 -k 1.4,1.5 -k 1.1,1.3'
#
# # Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
#
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
			*.jar)		jar xf $1	   ;;
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
		nvim $(ls | grep $1 | sort -R | tail -1)
	else
		nvim $(ls | sort -R | tail -1)
	fi
}

open_list_of_files_with_vim()
{
	if [ $# -gt 1 ] 
	then 
		echo "usage: o pen_list_of_files_with_vim [<FILE_PATTERN>]"
		return 1
	elif [ $# -eq 1 ]
	then
		vim $(find -type f | grep $1 | sort -V)
	else
		vim $(find -type f | sort -V)
	fi
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
				findparams="$findparams -maxdepth $2 "
				shift # past argument
				shift # past value
				;;
			-e|--exclude)
				findparams="$findparams ! -regex '.*/$2/?(/.*)?' "
				shift # past argument
				shift # past value
				;;
			-h|--exclude-hidden)
				findparams="$findparams ! -regex '.*/\..*' "
				shift # past value
				;;
			-r|--regex)
				findparams="$findparams -regex './$2' "
				shift # past argument
				shift # past value
				;;
			-n|--not)
				findparams="$findparams ! -regex './$2' "
				shift # past argument
				shift # past value
				;;
			-f|--file)
				findparams="$findparams -type f "
				shift # past argument
				;;
			-t|--time)
				findparams="$findparams -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head -n $2"
				findend=""
				shift # past argument
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

computation()
{
	local temp=$@
	echo $temp
	echo $(perl -E "say $temp")
}

tcpdump_2x_output()
{
	if [ $# -lt 1 ] 
	then
		echo "usage: tcpdump_2x_output [<FILE_PATH>] [OPTIONS]"
		return 1
	fi

	local filename=$1
	shift
	local arguments=$@

	echo "tcpdump $arguments -U -w - | tee $filename | tcpdump -r -"
	tcpdump $arguments -U -w - | tee $filename | tcpdump -r -
}

open_file_on_vimserver()
{
	if [ $# -ne 2 ] 
	then
		echo "usage: open_file_on_vimserver [<servername>] [<FILE_PATH>]"
		return 1
	fi
    nvim --server ~/.cache/nvim/server_$1.pipe --remote $(realpath $2)
	#open vim instance
	#fg
}

instantiate_nvim_server()
{
    if [ $# -eq 1 ]
    then
        FILE=~/.cache/nvim/server_$1.pipe
        if [ -f "$FILE" ]; then
            echo "$FILE already is in use"
        else
            nvim --listen $FILE
        fi
    fi
}

gitlogpreferences()
{
    if [ $# -eq 1 ]
    then
        git log --graph --oneline --decorate --all HEAD~$1..HEAD
    else
        git log --graph --oneline --decorate --all
    fi
}

runjuliacommand()
{
	julia -q --startup-file=no -E "$*"
}

connectwithsshx()
{
    kitty +kitten ssh cnode0$1
}

portforwardnotebook()
{
    echo "ssh -g -L $2:localhost:$2 -N cnode0$1"
    ssh -g -L $2:localhost:$2 -N cnode0$1
}

portforwardnotebooklab()
{
    echo "ssh -g -L $2:localhost:$2 -N $1"
    ssh -g -L $2:localhost:$2 -N $1
}

#functions end }}}

alias ..='cd ..'
alias bashhelp='nvim ~/configfiles/help/bashhelp.sh'
alias githelp='nvim ~/configfiles/help/githelp.sh'
alias severalhelp='nvim ~/configfiles/help/severalhelp.sh'
alias pumlhelp='nvim ~/configfiles/help/pumlhelp.sh'
alias tophelp='nvim ~/configfiles/help/tophelp'
alias mutthelp='nvim ~/configfiles/help/mutthelp.sh'
alias vimhelp='nvim ~/configfiles/help/vimhelp.vim'
alias nethelp='nvim ~/configfiles/help/nethelp.sh'
alias eud='execute_under_directory'
alias gitlog=gitlogpreferences
alias gits="git status -s"
alias fpwd='show_path'
alias pdf2bw='convert_pdf_to_greyscale'
alias watch05d='watch --color -n 0.5 -d'
alias pu='java -jar $PLANTUMLPATH'
alias ru='xdg-open'
alias ds='compare_directory_status -s'
alias dsd='compare_directory_status -d'
alias findx='compare_directory_status'
alias jupynote='python3 -c "from notebook.notebookapp import main; main()"' 
alias c="computation"
alias tcpdump2x="tcpdump_2x_output"

alias z='zellij'

alias v='nvim'
alias vr='nvim -M'
alias vran='open_random_file_with_vim'
alias vserv='instantiate_nvim_server'
alias vrem='open_file_on_vimserver'

alias stc='SimTreeGSControl'

alias s='connectwithsshx'
alias j='julia'
alias jc='runjuliacommand'

alias pubip4='dig @resolver4.opendns.com myip.opendns.com +short -4'
alias pubip6='dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6'

alias showjuliapkgversions='paste <(ls -1) <(cat $(find */Project.toml) | grep version)'

alias xc="xclip -sel c"

alias themeday="kitty +kitten themes Everforest Light Soft"
alias themenight="kitty +kitten themes 3024 Night"
alias kssh="kitty +kitten ssh"

alias printbattery="cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY="

set -o vi

#deactivate linux freeze with <C-s>
if [[ -t 0 && $- = *i* ]] 
then
	stty -ixon
fi

source ~/.bashrc_machine_specific.sh

PATH=$PATH:~/Downloads/Apps/texlab/bin
PATH=$PATH:~/Downloads/Apps/zellij
PATH=$PATH:~/chapps/bin
PATH=$PATH:~/.cargo/bin

export BULK="/u/bulk/home/wima/fchrstou"
export NEWIKR="/u/home/wima/fchrstou/IKRNEW/IKR/"

# JULIA DEPOT on bulk if in cnodes
if [[ `uname -n` == *"cnode"* ]]; then
	export JULIAUP_DEPOT_PATH="/u/bulk/home/wima/fchrstou/julia"
	export JULIA_DEPOT_PATH="/u/bulk/home/wima/fchrstou/julia"
fi

# If not in IKR devices
if [[ ! `uname -n` == *"cnode"* ]] && [[ ! `uname -n` == "pc114" ]] ; then

	PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/
	# install riggrep
fi

export ST_PATH=/u/home/wima/fchrstou/IKRNEW/IKR/Software/simtree_wrapper
function st(){
    source /u/home/wima/fchrstou/IKRNEW/IKR/Software/simtree_wrapper/st_wrapper.bash
}


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/u/home/wima/fchrstou/.juliaup/bin:*)
        ;;

    *)
        export PATH=/u/home/wima/fchrstou/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
