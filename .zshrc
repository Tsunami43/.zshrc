if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git docker zsh-autosuggestions history)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim"
alias ls="eza -l --tree --level=1 --icons=always --no-user --no-permissions"
alias hosts="cat ~/.ssh/config"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export PATH="$HOME/.cargo/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"

export PATH="/usr/local/bin:$PATH"

export HOMEBREW_NO_ENV_HINTS=1

export TMUX_CONF="$HOME/.config/tmux/tmux.conf"
alias tmux="tmux -f $TMUX_CONF"

alias ptest="poetry run pytest"
alias pvim="poetry run nvim ."
alias prun="poetry run python main.py"
alias kali="docker run -it leplusorg/kali bin/bash"
alias obsidian="nvim ~/Obsidian/Me/"
alias cloc="find . -type f \
    ! -path '*.txt' \
    ! -path '*.MOV' \
    ! -path '*.ogg' \
    ! -path '*.mp3' \
    ! -path '*.wav' \
    ! -path '*.mp4' \
    ! -path '*.mkv' \
    ! -path '*.flv' \
    ! -path '*.avi' \
    ! -path '*.mp4' \
    ! -path '*.jpg' \
    ! -path '*.png' \
    ! -path '*.jpeg' \
    ! -path '*.gif' \
    ! -path '*.svg' \
    ! -path '*.ico' \
    ! -path '*.pdf' \
    ! -path '*/.mypy_cache/*' \
    ! -path '*/.mypy/*' \
    ! -path '*/__pycache__/*' \
    ! -path '*/mypy_cache/*' \
    ! -path '*/mypy/*' \
    ! -path '*/dist/*' \
    ! -path '*/build/*' \
    ! -path '*/.pytest_cache/*' \
    ! -path '*/docs/*' \
    ! -path '*/.venv/*' \
    ! -path '*/venv/*' \
    ! -path '*/.git/*' \
    ! -path '*/.gitignore' \
    ! -path '*/*.session*' \
    ! -path '*/*.log' \
    ! -path '*/__pycache__/*' \
    ! -path '*/*.env' \
    ! -path '*/README*' \
    ! -path '*/node_modules/*' \
    ! -path '*/poetry.lock' \
    ! -path '*/pyproject.toml' \
    ! -path '*/package-lock.json' \
    ! -path '*/yarn.lock' \
    ! -path '*/pnpm-lock.yaml' \
    ! -path '*/yarn-error.log' \
    ! -path '*/yarn-debug.log' \
    ! -path '*/package.json' \
    ! -path '*/build/*' \
    ! -path '*/dist/*' \
    ! -path '*/go.mod' \
    ! -path '*/go.sum' \
    ! -path '*/target/*' \
    ! -path '*/Cargo.toml' \
    ! -path '*/Cargo.lock' \
    -exec wc -l {} +"

alias cat="bat --style=plain"


function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

eval "$(zoxide init zsh)"

export PATH=$HOME/development/flutter/bin:$PATH
