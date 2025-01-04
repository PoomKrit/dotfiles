# 1. Enable Powerlevel10k instant prompt (must be first)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 2. Environment variables and exports
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export KUBE_EDITOR="nvim"
export BAT_THEME=tokyonight_night
export NVM_DIR="$HOME/.nvm"

# 3. Homebrew and PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$HOME/.poetry/bin:$PATH

# 4. NVM initialization
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# 5. ZSH Configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh-My-Zsh plugins
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  terraform
  vscode
  aws
  alias-finder
  kubectl
  kubectx
)

source $ZSH/oh-my-zsh.sh

# 6. Zinit initialization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Zinit plugins with performance optimization
zinit ice silent blockf depth=1 wait"0"
zinit light zdharma-continuum/zinit-annex-as-monitor

zinit ice silent blockf depth=1 wait"0"
zinit light zdharma-continuum/zinit-annex-bin-gem-node

zinit ice silent blockf depth=1 wait"0"
zinit light zdharma-continuum/zinit-annex-patch-dl

zinit ice silent blockf depth=1 wait"0"
zinit light zdharma-continuum/zinit-annex-rust

# Additional Zinit plugins
zinit ice silent blockf wait"0"
zinit light zsh-users/zsh-completions

zinit ice silent blockf wait"0"
zinit light Aloxaf/fzf-tab

zinit ice silent blockf wait"0"
zinit light zsh-users/zsh-syntax-highlighting

zinit ice silent blockf wait"0"
zinit light zsh-users/zsh-autosuggestions

# 7. Completion configuration
autoload -Uz compinit && compinit
zinit cdreplay -q

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# 8. FZF Configuration
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# FZF preview configurations
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# FZF functions
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

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

# Initialize FZF
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
source ~/github/fzf-git.sh/fzf-git.sh

# 9. Aliases
# Tool aliases
alias tm="tmux"
alias t="tree"
alias n="nix"
alias tg="terragrunt"
alias c="cat"
alias b="bat"
alias ..="cd .."
alias vi="nvim"
alias v="nvim"
alias nvimdiff="nvim -d"
alias y="yarn"
alias lg="lazygit"

# Kubernetes aliases
alias ks='kustomize'
alias kx='kubectx'
alias kns='echo 'NAMESPACE'\\n;kubectl config view --minify -o jsonpath={..namespace};echo'
alias kcns='kubectl config set-context --current --namespace'
alias e='eksctl'
alias h='helm'

# Development tools
alias python='python3'
alias dk='docker'
alias pdm='podman'
alias j='jobs'

# AWS and related tools
alias a='aws'
alias ap='eval $(/Users/poomkrit/dotfiles/aws-profile-selection/aws-profile-selection.sh)'
alias ali='. $HOME/git/aws-tools/aws-login.sh'
alias vlt='vault'
alias sam='saml2aws'
alias cflt='confluent'

# Git aliases
alias gt='git tag'
alias gmj='gitmoji'

# Random string generators
alias randA="LC_CTYPE=C tr -dc A-Z </dev/urandom | head -c 100 |xargs"
alias randAa="LC_CTYPE=C tr -dc A-Za-z </dev/urandom | head -c 100 |xargs"
alias randa="LC_CTYPE=C tr -dc a-z </dev/urandom | head -c 100 |xargs"
alias randA0="LC_CTYPE=C tr -dc A-Z0-9 </dev/urandom | head -c 100 |xargs"
alias rand0="LC_CTYPE=C tr -dc 0-9 </dev/urandom | head -c 100 |xargs"
alias randall="LC_CTYPE=C tr -dc A-Za-z0-9 </dev/urandom | head -c 100 |xargs"

# Utility aliases
alias yp='pwd | pbcopy ; pbpaste'
alias ls="eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions"
alias lsnc="eza --color=always --long --git --icons=never --no-filesize --no-time --no-user --no-permissions"
alias l="eza --all --color=always --long --git --icons=always"

# Prompting AWS Profile
alias awswho="echo Current AWS Profile: \${AWS_PROFILE:-default}"

aws() {
    echo "Using AWS Profile: ${AWS_PROFILE:-default}"
    command aws "$@"
}

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt sharehistory
setopt inc_append_history
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt rmstarsilent
setopt HIST_NO_STORE

# Save cancelled commands
save_and_interrupt() {
    print -s -- "$BUFFER"
    zle reset-prompt
}
zle -N save_and_interrupt
bindkey "^C" save_and_interrupt

# 11. Amazon Q integration
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# 12. P10k configuration (must be last)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
