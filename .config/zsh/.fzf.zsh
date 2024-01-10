# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**' # change ** to whatever you like

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --info=inline --border --margin=1 --padding=1"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# Find File and Edit
Find_Edit() {
    local file=$(
        fd -t f -H --no-ignore-vcs | \
            fzf --query="$1" --no-multi --select-1 --exit-0 \
                --preview 'bat --color=always --line-range :500 {}'
    )
    mimetype=$(file  --dereference --brief --mime-type  "$file" )
case "$mimetype" in
    image/*)                    nsxiv "$file" & disown ;;
    text/* | */xml)             $EDITOR "$file" ;;
    video/* | audio/*)          vlc "$file" & disown ;;
    application/pdf)             okular "$file" & disown ;;
    *) ;;
esac
}

# Find Directory and Change
Change_Directory() {
    local dir=$(
    cd && \
        fd -t d -H --no-ignore-vcs | \
            fzf --query="$1" --no-multi --select-1 --exit-0 \
                --preview 'tree -C {} | head -100'
    )
    if [[ -n $dir ]]; then
        cd && cd "$dir"
    fi
}

bindkey -s '^f' 'Change_Directory\n'
bindkey -s '^g' 'Find_Edit\n'

# alias re='Find_Edit'
# alias ro='Change_Directory'
