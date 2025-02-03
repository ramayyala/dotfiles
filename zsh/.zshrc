# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/${HOME}/${USER}/.local/bin:$PATH"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history)
ZSH_THEME="spaceship"
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

export LS_COLORS="rs=0:no=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32:"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY=1
plugins=(
    command-not-found
    extract
    deno
    docker
    git
    github
    gitignore
    history-substring-search
    node
    npm
    nvm
    yarn
    volta
    vscode
    sudo
    web-search
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
    ohmyzsh-full-autoupdate
    zsh-interactive-cd
    colorize
    fancy-ctrl-z
)
source $ZSH/oh-my-zsh.sh

# User configuration
#colorize config
ZSH_COLORIZE_STYLE="colorful"
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
alias hoffman='ssh ramayyal@hoffman2.idre.ucla.edu'
alias margaret='ssh mdistler@hoffman2.idre.ucla.edu'
alias trgn='ssh rayyala@trgn.usc.edu'
alias tunnel='ssh rayyala@trgn.bioinform.io'
alias jj='ssh victorx@hoffman2.idre.ucla.edu'
alias discovery="ssh rayyala@discovery2.usc.edu"
alias dottie="ssh dottieyu@discovery2.usc.edu"
alias hpc-transfer="ssh rayyala@hpc-transfer1.usc.edu"
alias czbiohub="ssh ram.ayyala@login-01.czbiohub.org"
alias refresh="source ~/.zshrc"
alias github="cd ~/github"
alias kill="sudo pkill -9"
alias recycle="trash-put"
alias ls_trash="trash-list" 
alias empty_trash="trash-empty"
alias restore_trash="trash-restore" 
alias delete="trash-rm"
#alias /mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe -Command
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#zoxide install
eval "$(zoxide init --cmd cd zsh)"

#ls aliases
alias ls='eza -al --color=always --group-directories-first --icons'     # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'      # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'      # long format
alias lt='eza -aT --color=always --group-directories-first --icons'     # tree listing
alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

#vim aliases
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

#thefuck aliases
eval $(thefuck --alias fuck)

# bun completions
[ -s "/$HOME/${USER}/.bun/_bun" ] && source "/$HOME/${USER}/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


#BIND KEYS
bindkey -s '^f' 'nvim $(fzf)\n' # binds control+f to fzf search and the selected file gets opened in neovim 
#history searcher 

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down





# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ram.ayyala/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ram.ayyala/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ram.ayyala/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ram.ayyala/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/ram.ayyala/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/ram.ayyala/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

