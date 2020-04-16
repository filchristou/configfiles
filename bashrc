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

#write the extract skript here
extract () {
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
		   *.Z)			uncompress $1  ;;
		   *.7z)		7z x $1		   ;;
		   *)			echo "don't know how to extract '$1'..." ;;
	   esac
	else
	   echo "'$1' is not a valid file!"
	fi
 }

#functions end }}}

force_color_prompt=yes

#change the shell promt
#	encapsulate non-printing characters inside '\[' and '\]'
#	\e[1m means *bold* typing. \e[0m means "normal" typing
export PS1='\[\e[1m\]\u@\h:\w$ \[\e[0m\]'
alias ls='ls --color'
alias l='ls'
alias ll='ls -la'
alias grep='grep --color'
alias ..='cd ..'
alias uscmd='vim ~/configfiles/usefullcommands.sh'
alias eud='execute_under_directory'
alias v='vim'
alias diff='diff --color'

#evn variables
export PYTHONPATH="$PYTHONPATH:/net/arch/opt/cplex/cplex/python/3.6/x86-64_linux/:$HOME/Research/pythonutils"

#always start in home folder
cd $HOME
