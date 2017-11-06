# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/lelion/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

BULLETTRAIN_TIME_BG="white"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo)

source $ZSH/oh-my-zsh.sh
source /usr/share/doc/pkgfile/command-not-found.zsh
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

# KEYBIND
cdUndoKey(){
	popd	> /dev/null
	zle	reset-prompt
	echo
	ls
	echo
}
cdParentKey(){
	pushd .. > /dev/null
	zle	reset-prompt
	echo
	ls
	echo
}
zle -N			cdParentKey
zle -N			cdUndoKey
bindkey '^[[1;3A'	cdParentKey
bindkey '^[[1;3D'	cdUndoKey


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias l="ls -ht --group-directories-first -B --hide='*.class'"
alias la="ls -hlta --group-directories-first"
alias ll="ls -lht --group-directories-first -B --hide='*.class'"
alias pac='sudo pacman -S '
alias zshconf="vim ~/dotfiles/zshrc"
alias szsh='source ~/dotfiles/zshrc'
alias vimrc='vim ~/dotfiles/vimrc'
alias jc='javac *.java'
alias aupdate='sudo pacnanny -Syu'
alias t='tree'
alias polyconf='vim ~/dotfiles/polybar/config'
alias todo='vim ~/Documents/arch-todo-list'
alias checkports='sudo nmap -sT -O localhost'

alias pbar='~/dotfiles/polybar/launch.sh'

# Paths
alias 1010='~/Documents/INF1010'
alias 2810='~/Documents/INF2810'
alias 2100='~/Documents/h17/inf2100'
alias 1060='cd ~/Documents/h17/inf1060'


# Smart matching, i.e doc/1010/o4 = Documents/INF1010/Oblig4
zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
# Run ls after every change of directory
chpwd() { ls --hide='*.class' -B --group-directories-first }

# Colored man pages
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
