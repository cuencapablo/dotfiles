#!/bin/sh

userresources=$HOME/.config/x/.Xresources
usermodmap=$HOME/.config/x/.Xmodmap

# merge in defaults and keymaps
if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# --- General Settings --- #
## variables
export PATH=$HOME/.local/bin:$HOME/.local/share/applications/:$HOME/.local/bin/statusbar:$PATH
export PATH="/home/non/.local/share/fnm:$PATH"
export EDITOR=nvim
export READER=sioyek

# Load fnm for node versions
eval "$(fnm env)"

## background
/usr/bin/feh --no-fehbg --bg-fill '/home/non/Pictures/wallpaper/land.png'
## programs
tmux has-session -t me || st -n me -e tmux new -s me &
xbindkeys &
xbanish &
xcompmgr -nC &
dwmblocks &
exec dwm
