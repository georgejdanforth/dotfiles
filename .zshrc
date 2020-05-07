# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set default username
DEFAULT_USER="george"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="george-theme"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-autosuggestions brew web-search httpie osx)

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
export EDITOR="nvim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#
# Misc. keys and stuff I don't want to version control
source $HOME/.keys

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias zshconfig="$EDITOR ~/.zshrc"
alias cat="pygmentize -g"
alias ls="gls --color"
alias dircolors="gdircolors"
alias vimconfig="$EDITOR ~/.config/nvim/init.vim"
alias logins="logins.py"
alias libreoffice="soffice"
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Activate ls colors
eval `dircolors ~/.dir_colors/dircolors.256dark`

# Syntax highlighting options
#
# Only use 'main' syntax highlighting, e.g. keywords and paths
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
# Source syntax highlighting:
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Color palette, taken from gruvbox colorscheme for consistency with vim.
BRIGHT_RED=167
BRIGHT_GREEN=142
BRIGHT_YELLOW=214
BRIGHT_BLUE=109
BRIGHT_PURPLE=175
BRIGHT_AQUA=108
BRIGHT_ORANGE=208

NEUTRAL_RED=124
NEUTRAL_GREEN=106
NEUTRAL_YELLOW=172 
NEUTRAL_BLUE=66
NEUTRAL_PURPLE=132
NEUTRAL_AQUA=72
NEUTRAL_ORANGE=166

FADED_RED=88
FADED_GREEN=100
FADED_YELLOW=136
FADED_BLUE=24
FADED_PURPLE=96
FADED_AQUA=66
FADED_ORANGE=130

# Highlighting options:
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=$BRIGHT_RED,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=$BRIGHT_AQUA
ZSH_HIGHLIGHT_STYLES[command]=fg=$BRIGHT_GREEN,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=$BRIGHT_GREEN,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=$BRIGHT_GREEN,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=$BRIGHT_GREEN,bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=$BRIGHT_YELLOW
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=$BRIGHT_YELLOW



# Title bar color -- adjust rgb values after 'brightness;'
# printf -- $'\033]6;1;bg;red;brightness;40\a\033]6;1;bg;green;brightness;40\a\033]6;1;bg;blue;brightness;40\a'

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
