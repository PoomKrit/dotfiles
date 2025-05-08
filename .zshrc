# 1. Enable Powerlevel10k instant prompt (must be first)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 2. Environment variables and exports
export GEMINI_API_KEY="AIzaSyC0DmMOWJGjKwHCurVX2-hbDQFQPhTD6SY"
export DEEPSEEK_API_KEY="sk-0a14a80f346c44d6bacc8ef14aaeb6bf"
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export KUBE_EDITOR="nvim"
export BAT_THEME=tokyonight_night
export NVM_DIR="$HOME/.nvm"

# 3. Homebrew and PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$HOME/.poetry/bin:$PATH:$HOME/.local/bin

# 4. NVM initialization
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# 5. ZSH Configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh-My-Zsh plugins
plugins=(
  git
  tmux
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
  helm
  kubectl
  kubectx
  istioctl
  iterm2
  jsontools
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
zinit ice silent blockf depth=1
zinit light zdharma-continuum/zinit-annex-as-monitor
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl
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
alias tks="tmux kill-server"
alias t="tree"
alias n="nix"
alias tg="terragrunt"
alias c="cat"
alias b="bat"
alias clr="clear"
alias ..="cd .."
alias vi="nvim"
alias v="nvim"
alias nvimdiff="nvim -d"
alias lg="lazygit"
alias lzd="lazydocker"
alias kp="keepassxc-cli"

# Kubernetes aliases
alias ks='kustomize'
alias kx='kubectx'
alias kns='echo 'NAMESPACE'\\n;kubectl config view --minify -o jsonpath={..namespace};echo'
alias kctx='kubectl config current-context'

# Development tools
alias python='python3'
alias dk='docker'
alias dki='docker images'
# alias olm='ollama' -- move to docker
alias clm='colima'
alias pdm='podman'
alias j='jobs'

# AWS and related tools
alias a='aws'
alias ap='eval $(/Users/poomkrit/dotfiles/aws-profile-selection/aws-profile-selection.sh)'
alias ghg='~/dotfiles/ghorg_config.sh'
alias ali='. $HOME/git/aws-tools/aws-login.sh'
alias vlt='vault'
alias sam='saml2aws'
alias cflt='confluent'

# Git aliases
alias gt='git tag'
alias gmj='gitmoji'

# Terragrunt
alias tgi='terragrunt init'
alias tgv='terragrunt validate'
alias tgp='terragrunt plan'
alias tga='terragrunt apply'
alias tgd='terragrunt destroy'
alias tgo='terragrunt output'
alias tgaa='terragrunt apply -auto-approve'

# Mac setup for pomo as functions
work() {
  timer "$1"
  osascript -e 'display notification "Pomodoro" with title "Work Timer is up! Take a Break 😊"'
}

rest() {
  timer "$1"
  osascript -e 'display notification "Pomodoro" with title "Break is over! Get back to work 😬"'
}

# Making it round
pomo() {
  echo "How many rounds you want to do?"
  read count;
  for i in {1..$count};
  do
          echo '' && work $1;
          echo "Congrat on your good work! Starting the rest timer in 3 seconds";
          sleep 3;
          echo '' && rest $2;
  done
}

# Random string generators
randA() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="up" --len="$length"
}

randa() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="low" --len="$length"
}

rand0() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="num" --len="$length"
}

randAa() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="up,low" --len="$length"
}

randA0() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="up,num" --len="$length"
}

randa0() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="low,num" --len="$length"
}

randAa0() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="up,low,num" --len="$length"
}

randall() {
  local length=${1:-16}  # Default length to 16 if not provided
  generate_random_key --type="up,low,num,sp" --len="$length"
}

# Utility aliases
alias yp='pwd | pbcopy ; pbpaste'
alias ls="eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions --sort=created"
alias lsnc="eza --color=always --long --git --icons=never --no-filesize --no-time --no-user --no-permissions --sort=created"
alias l="eza --all --color=always --long --git --icons=always --sort=created"

# Prompting AWS Profile
alias awho="echo Current AWS Profile: \${AWS_PROFILE:-default}"
#
# aws() {
#     echo "Using AWS Profile: ${AWS_PROFILE:-default}"
#     command aws "$@"
# }

# 10. History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# setopt sharehistory
# setopt inc_append_history
# setopt appendhistory
# setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_find_no_dups
# setopt rmstarsilent
# setopt HIST_NO_STORE

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

# Created by `pipx` on 2025-01-05 08:03:35
export PATH="$PATH:/Users/poomkrit/.local/bin"

# --- Yazi setup --- #
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# TRAPEXIT() {
#   tmux run-shell ~/.config/tmux/plugins/tmux-resurrect/scripts/save.sh
# }
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}

# Generate random key
generate_random_key() {
  local length=16  # Default length
  local include_lower=0
  local include_upper=0
  local include_number=0
  local include_special=0
  local charset=""
  local result=""

  # Help message
  if [[ "$1" == "--help" ]]; then
    cat <<EOF
Usage: generate_random_key [OPTIONS]

Options:
  --type="low,up,num,sp"   Include specific character types:
       - low : lowercase letters (a-z)
       - up  : uppercase letters (A-Z)
       - num : numbers (0-9)
       - sp  : special characters (!@#\$%^&* etc.)
  --len=N | --length=N       Set length of the key (default: 16)
  --help                     Show this help message

Examples:
  generate_random_key --type="low,up,num" --len=12
  generate_random_key --type="low,num,sp" --length=8
EOF
    return 0
  fi

  # Parse arguments
  while [[ "$1" != "" ]]; do
    case $1 in
      --type=*)
        local types="${1#*=}"
        [[ "$types" =~ "low" ]] && include_lower=1
        [[ "$types" =~ "up" ]] && include_upper=1
        [[ "$types" =~ "num" ]] && include_number=1
        [[ "$types" =~ "sp" ]] && include_special=1
        ;;
      --len=*|--length=*)
        length="${1#*=}"
        if ! [[ "$length" =~ '^[0-9]+$' ]]; then
          cat <<EOF
Error: Invalid length. Please enter a numeric value.
EOF
          return 1
        fi
        ;;
      *)
        cat <<EOF
Invalid option: $1
Use --help to see available options.
EOF
        return 1
        ;;
    esac
    shift
  done

  # Construct character set
  [[ $include_lower -eq 1 ]] && charset+="abcdefghijklmnopqrstuvwxyz"
  [[ $include_upper -eq 1 ]] && charset+="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  [[ $include_number -eq 1 ]] && charset+="0123456789"
  [[ $include_special -eq 1 ]] && charset+="!@#\$%^&*()-_=+[]{};:'\",.<>?/\\|"

  if [[ -z "$charset" ]]; then
    cat <<EOF
Error: No character type selected. Use --type="low,up,num,sp"
EOF
    return 1
  fi

  # Generate random key using zsh's proper indexing
  for ((i = 0; i < length; i++)); do
    result+="${charset[$((RANDOM % ${#charset} + 1))]}"
  done

  echo "$result"
}
