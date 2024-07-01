# install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#
# ============ Set Environment Variables ============
#

PATH=$PATH:~/Downloads/Apps/texlab/bin
PATH=$PATH:~/chapps/bin
PATH=$PATH:~/.cargo/bin

# JULIA DEPOT on bulk if in cnodes
if [[ `uname -n` == *"cnode"* ]]; then
	export JULIAUP_DEPOT_PATH="/u/bulk/home/wima/fchrstou/julia"
	export JULIA_DEPOT_PATH="/u/bulk/home/wima/fchrstou/julia"
    export BULK="/u/bulk/home/wima/fchrstou"
fi

export EDITOR=nvim

# If not in IKR devices
if [[ ! `uname -n` == *"cnode"* ]] && [[ ! `uname -n` == "pc114" ]] ; then

	PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/
	# install riggrep
fi


# some functions
source ~/configfiles/zshrcmore.zsh
# machine specific (not in github)
source ~/.bashrc_machine_specific.sh
# fzf zsh functionalities
source <(fzf --zsh)

#
# ============ Plugins ============
#

eval "$(starship init zsh)"

autoload -Uz compinit && compinit

zinit light Aloxaf/fzf-tab

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit snippet OMZP::colorize

zinit cdreplay -q

#
# ============ General ============
#

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# History
# HISTSIZE=5000
# HISTFILE=~/.zsh_history
# SAVEHIST=$HISTSIZE
# HISTDUP=erase
# setopt appendhistory
# setopt sharehistory
# setopt hist_ignore_space
# setopt hist_ignore_all_dups
# setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_find_no_dups
# setopt auto_cd

# Keybindings
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[w' kill-region
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# fzf-tab config
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# light theme adaptation
zstyle ':fzf-tab:*' fzf-flags --color=light

#deactivate linux freeze with <C-s>
if [[ -t 0 && $- = *i* ]] 
then
	stty -ixon
fi


#
# ============ Aliases ============
# 

alias printbattery="cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY="
alias fpwd='show_path'
alias s='connecttocnodes'
alias j='julia'
alias jc='runjuliacommand'
alias v='nvim'
alias t='tmux'
alias ru='xdg-open'
alias gits="git status -s"
alias gitlog=gitlogpreferences
alias ..='cd ..'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
