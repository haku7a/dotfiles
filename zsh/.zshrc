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

if ! command -v xclip &> /dev/null && [[ "$(uname -r)" != *microsoft* ]]; then
    echo "ERROR: Clipboard access requires xclip. Install: sudo apt install xclip"
    LANG=$ORIG_LANG
    return 1
fi

LANG=$ORIG_LANG
}