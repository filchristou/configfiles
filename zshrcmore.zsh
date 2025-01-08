show_path()
{
	readlink -e $1
	if [ $? -eq 1 ]; then
		echo "Cannot resolve path '$(realpath $1)'"	
	fi
}

connecttocnodes()
{
    ssh cnode0$1 -to RemoteCommand="zsh -l"
}

runjuliacommand()
{
	julia -q --startup-file=no -E "$*"
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
