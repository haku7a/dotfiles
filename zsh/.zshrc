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

_generate_structure() {
    local item="$1"
    local indent="$2"
    local name="${item:t}"

    local excluded=0
    for pattern in "${exclude[@]}"; do
        if [[ "$name" == ${~pattern} ]]; then
            excluded=1
            break
        fi
    done

    if (( excluded )); then
        if [[ -d "$item" ]]; then
            echo "${indent}${name}/ (exclude)"
        else
            echo "${indent}${name} (exclude)"
        fi
        return
    fi

    if [[ -d "$item" ]]; then
        echo "${indent}${name}/"
        for subitem in "$item"/*(ND); do
            _generate_structure "$subitem" "${indent}  "
        done
    else
        local file_status=""
        if [[ ! -r "$item" ]]; then
            file_status=" (no access)"
        elif [[ ! -s "$item" ]]; then
            file_status=" (empty)"
        else
            local mime_type=$(file -b --mime-type "$item" 2>/dev/null)
            if [[ "$mime_type" != text/* && "$mime_type" != application/json ]]; then
                file_status=" (binary)"
            fi
        fi
        echo "${indent}${name}${file_status}"
    fi
}

_process_path() {
    local item="$1"

    for pattern in "${exclude[@]}"; do
        if [[ "${item:t}" == ${~pattern} ]]; then
            return
        fi
    done

    if [[ -d "$item" ]]; then
        for subitem in "$item"/*(ND); do
            _process_path "$subitem"
        done
    return
    fi

    local rel_path="file: ${item#$PWD/}"
    local file_status=""
    
    if [[ ! -r "$item" ]]; then
        file_status=" (no access)"
    elif [[ ! -s "$item" ]]; then
        file_status=" (empty)"
    fi

    echo -n "${rel_path}${file_status}"

    if [[ -r "$item" && -s "$item" ]]; then
        local mime_type=$(file -b --mime-type "$item")
        if [[ "$mime_type" == text/* || "$mime_type" == application/json ]]; then
            echo
            cat "$item"
            echo
        else
            echo " (binary)"
        fi
    else
        echo
    fi
}

local structure_output=$(_generate_structure "$PWD" "")
local file_contents_output=$(_process_path "$PWD")
local output="Project structure:\n${structure_output}\n\nFile contents:\n${file_contents_output}"

case "$(uname -s)" in
    Linux*)
    if grep -qi microsoft /proc/version; then
        echo "$output" | iconv -f UTF-8 -t UTF-16LE | clip.exe
    else
        echo "$output" | xclip -selection clipboard
    fi
      ;;
    Darwin*) echo "$output" | pbcopy ;;
    *) echo "Unsupported OS" && LANG=$ORIG_LANG && return 1 ;;
esac

LANG=$ORIG_LANG
}