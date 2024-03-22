# Options to fzf command
export FZF_DEFAULT_OPTS="--height 70% \
  --border \
  --info=inline \
  --layout=reverse \
  --prompt '∷ ' \
  --pointer ▶   \
  --marker ⇒ \
  --color=gutter:-1"

# Find File and Edit
Find_Edit() {
    local file=$(
        fd -t f -H --no-ignore-vcs | \
            fzf --query="$1" --no-multi --select-1 --exit-0 \
                --preview 'bat --color=always --style=numbers,changes --line-range :500 {}'
    )
    mimetype=$(file  --dereference --brief --mime-type  "$file" )
    case "$mimetype" in
        image/*)                          nsxiv "$file" & disown ;;
        application/pdf)                  sioyek "$file" & disown ;;
        text/* | application/* | */xml)   $EDITOR "$file" ;;
        video/*)                          mpv "$file" & disown ;;
        audio/*)                          ncmpcpp "$file" & disown ;;
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

# Find Directory and Change
Change_Local_Dir() {
    local dir=$(
      fd -t d -H --no-ignore-vcs | \
          fzf --query="$1" --no-multi --select-1 --exit-0 \
              --preview 'tree -C {} | head -100'
    )
    if [[ -n $dir ]]; then
        cd "$dir"
    fi
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

bindkey -s '^f' 'Change_Directory\n'
bindkey -s '^e' 'Change_Local_Dir\n'
bindkey -s '^g' 'Find_Edit\n'
bindkey -s '^r' 'fh\n'

# alias re='Find_Edit'
# alias ro='Change_Directory'
