if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx >/dev/null 2>&1   # remove the exec to remain logged in when your wm ends
fi
