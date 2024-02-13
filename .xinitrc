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
export PATH=$HOME/.local/bin:$HOME/.local/share/applications/:$HOME/.local/bin/statusbar:/usr/local/bin:/usr/local/texlive/2023/bin/x86_64-linux:/usr/local/texlive/2023/bin/x86_64-linux:$PATH
export EDITOR=nvim
export VISUAL=nvim
export READER=okular
export _JAVA_AWT_WM_NONREPARENTING=1

# Load fnm for node versions
eval "$(fnm env)"

## background
/usr/bin/feh --no-fehbg --bg-fill '/home/non/Pictures/wallpaper/girlBirdGun.png'
## programs
xbindkeys &
unclutter &
xcompmgr -nC &
dwmblocks &
exec dwm
