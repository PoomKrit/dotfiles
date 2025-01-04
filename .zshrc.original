# Amazon Q pre block. Keep at the top of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# make sure ssh-agent is running
# eval "$(ssh-agent -s)" 

# adding private key for accor git repository
# ssh-add -q ~/.ssh/krittanon_accor
# ssh-add -q ~/.ssh/krittanon_accor_pci# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# If you come from bash you might have to change your $PATH.
# export OLLAMA_MODELS=/Volumes/home/Models_Assistant
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$HOME/.poetry/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
# Standard  can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

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

plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-autosuggestions
  zsh-syntax-highlighting
  terraform
  vscode
  aws
  alias-finder
  kubectl
  kubectx
)

alias tm="tmux"
alias t="tree"
alias n="nix"
alias tg="terragrunt"
alias c="cat"
alias ..="cd .."
alias vi="nvim"
alias v="nvim"
alias nvimdiff="nvim -d"
alias y="yarn"
alias lg="lazygit"
alias randA="LC_CTYPE=C tr -dc A-Z </dev/urandom | head -c 100 |xargs"
alias randAa="LC_CTYPE=C tr -dc A-Za-z </dev/urandom | head -c 100 |xargs"
alias randa="LC_CTYPE=C tr -dc a-z </dev/urandom | head -c 100 |xargs"
alias randA0="LC_CTYPE=C tr -dc A-Z0-9 </dev/urandom | head -c 100 |xargs"
alias rand0="LC_CTYPE=C tr -dc 0-9 </dev/urandom | head -c 100 |xargs"
alias randall="LC_CTYPE=C tr -dc A-Za-z0-9 </dev/urandom | head -c 100 |xargs"
alias ks='kustomize'
alias kx='kubectx'
alias kns='echo 'NAMESPACE'\\n;kubectl config view --minify -o jsonpath={..namespace};echo'
alias kcns='kubectl config set-context --current --namespace'
alias e='eksctl'
alias h='helm'
alias python='python3'
alias dk='docker'
alias pdm='podman'
alias j='jobs'

# AWS
alias a='aws'
# alias ap='eval $(/Users/poomkrit/Library/CloudStorage/SynologyDrive-scripts/aws-profile-selection.sh)'
alias ap='eval $(/Users/poomkrit/dotfiles/aws-profile-selection/aws-profile-selection.sh)'

# Git
alias gt='git tag'
alias gmj='gitmoji'
# alias gdif='git diff'

# Vault
alias vlt='vault'
# Saml2aws
alias sam='saml2aws'

# aws-login with MFA - crea
alias ali='. $HOME/git/aws-tools/aws-login.sh'

# confluent kafka
alias cflt='confluent'

# copy path to clipboard
alias yp='pwd | pbcopy ; pbpaste'

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt rmstarsilent					# Set zsh not to confirm delete file


export EDITOR="nvim"
export KUBE_EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme


# export PATH="$HOME/.poetry/bin:$PATH"
source /Users/poomkrit/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Define snippets directory explicitly (optional, but recommended)
# ZINIT[SNIPPETS_DIR]=~/.local/share/zinit/snippets

# Add in snippets
# zinit snippets OMZP::git
# zinit snippets OMZP::sudo
# zinit snippets OMZP::archlinux
# zinit snippets OMZP::aws
# zinit snippets OMZP::kubectl
# zinit snippets OMZP::kubectx
# zinit snippets OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- Eza (better ls) -----

alias ls="eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions"
alias lsnc="eza --color=always --long --git --icons=never --no-filesize --no-time --no-user --no-permissions"
alias l="eza --all --color=always --long --git --icons=always"
# alias cd="z"

# ---- fzf (better fuzzy files manager) -----
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/github/fzf-git.sh/fzf-git.sh

# ----- Bat (better cat) -----
alias b="bat"
export BAT_THEME=tokyonight_night

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# To customize prompt, run `p10k configure` or edit ~/Library/CloudStorage/SynologyDrive-scripts/.p10k.zsh.
# [[ ! -f ~/Library/CloudStorage/SynologyDrive-scripts/.p10k.zsh ]] || source ~/Library/CloudStorage/SynologyDrive-scripts/.p10k.zsh

# Make the prompt stay almost on top
# source /Users/poomkrit/github/almostontop/almostontop.plugin.zsh

# Starship
# export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
# eval "$(starship init zsh)"
