export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export_dir_tree() {
local ORIG_LANG=$LANG
export LANG=C.UTF-8

local exclude=(
    ".git"
    "*.env*"
    ".mypy_cache"
    ".venv"
    "__pycache__"
  )

LANG=$ORIG_LANG
}