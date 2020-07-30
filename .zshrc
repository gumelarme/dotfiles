# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gumendol/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize colored-man-pages vi-mode tmux)
ZSH_TMUX_AUTOCONNECT=false
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export TERM="xterm-256color"
export EDITOR="/usr/bin/vim"
export rex="/run/media/gumendol/rex"
export sch="/run/media/gumendol/rex/school/nfu_2/"
export toad="/run/media/gumendol/toad"
export goproj=~/go/src/github.com/gumelarme
export proxyaddr="http://127.0.0.1:8888"
# alias cdrex="cd /run/media/gumendol/rex"
alias crex="cd $rex"
alias csch="cd $sch"
alias ctoad="cd $toad"
alias ajup="source $rex/code/python/venv/jupyter_lab/bin/activate"
alias setprox="export http_proxy=$proxyaddr && export https_proxy=$proxyaddr"
alias unprox="unset HTTP_PROXY && unset HTTPS_PROXY && unset http_proxy && unset https_proxy"
alias gprox="git config --global http.proxy $proxyaddr && git config --global https.proxy $proxyaddr"
alias gunprox="git config --global --unset http.proxy && git config --global --unset https.proxy"
# alias tlist="tmux list-sessions"
alias tkill='f(){tmux kill-session -t $1}; f'
alias va='source ./venv/bin/activate'
alias vd='deactivate'
alias notej='vim $rex/notes/journal/index.md'
alias notex='vim $rex/notes/school/index.md'
alias wik="kiwix-serve --verbose --port 38981 /run/media/gumendol/toad/wikipedia_en_all_maxi_2018-10.zim"
alias zr="source ~/.zshrc"
alias pa="php artisan $*"

alias pms="termdown 25m && dunstify -a pomo -u critical \"Pomodoro\" \"Session Time Out\""
alias pmb="termdown 5m && dunstify -a pomo -u normal \"Pomodoro\" \"Break Time Out\""

ppt_to_pdf(){
	mkdir -p pdf
	let n=$(find . -type f -name '*.pptx' | wc -l)a
	echo "Converting ${n} files to pdf ...."
	let counter=1
	for file in *.pptx
	do
		echo -n "[$counter/$n] ${file}...."
		unoconv -o "pdf/${file%.*}.pdf" -f pdf "${file}"
		echo "[DONE]"
		((counter++))
	done
}

mount_bonobos(){
	if [ ! -d "/run/media/gumendol/bonobos" ]; then
		sudo mkdir /run/media/gumendol/bonobos
		sudo mount /dev/sda1 /run/media/gumendol/bonobos
		echo "Mounted successfully!"
	else
		echo "Already mounted"
	fi
}

mount_ame(){
	if [ ! -d "/run/media/gumendol/ame" ]; then
		sudo mkdir /run/media/gumendol/ame
		sudo mount /dev/sda4 /run/media/gumendol/ame
		echo "Mounted successfully!"
	else
		echo "Already mounted"
	fi
}

# Fzf completition
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
