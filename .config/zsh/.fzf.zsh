# Options to fzf command
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --info=inline --border --margin=1 --padding=1"

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
