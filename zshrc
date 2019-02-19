stty -ixon
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/jonas/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random" # it'll load a random theme each time that oh-my-zsh is loaded.  # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-nvm
  thefuck
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# THIS WAS BEFORE OH-MZ-YSH:
#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory autocd
#bindkey -v
 #End of lines configured by zsh-newuser-install
 #The following lines were added by compinstall
#zstyle :compinstall filename '/home/jonas/.zshrc'

autoload -Uz compinit
compinit
 #End of lines added by compinstall

autoload -Uz promptinit
promptinit

function startI3 {
	if [[ $XDG_VTNR -eq 1 ]]; then
		C_DESKTOP=i3 startx
	fi
}

function startSway {
	if [[ $(tty) = /dev/tty1 ]]; then
		XKB_DEFAULT_LAYOUT=ch sway
	fi
}

function startKDE {
	if [[ $XDG_VTNR -eq 1 ]]; then
		C_DESKTOP=kde startx
	fi
}


if [ -z "$DISPLAY" ]; then
	clear

	print -P "\n  %B%F{green}Salü JC!%f%b\n"
	print -P "  Uindou mänädtscher uswähle %B%F{yellow}(default=1)%f%b:\n"
	print -P "    %B%F{blue}*%f %F{yellow}(1) i3%f%b"
	print -P "    %B%F{blue}*%f %F{yellow}(2) sway%f%b"
	print -P "    %B%F{blue}*%f %F{yellow}(3) plasma%f%b\n"
	echo -n "  Dini uswau: "
	read i
	case  $i in
	1)
		startI3
		;;
	2)
		startSway
		;;
	3)
		startKDE
		;;
	*)
		startI3
		;;
	esac

	clear
fi

alias dc='docker-compose'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias cat='bat'

#fasd
eval "$(fasd --init auto)"

# Pyenv
export PATH="/home/jonas/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#yarn 
PATH="$PATH:$(yarn global bin)"

#nmtui
alias networkui="nmtui"

# SSH ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-cache
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-cache)"
fi

# this needs to be last (autostart tmux)
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux
