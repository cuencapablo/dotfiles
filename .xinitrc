#!/bin/sh

userresources=$HOME/.config/x/.Xresources
usermodmap=$HOME/.config/x/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi
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
export PATH=$HOME/.local/bin:$HOME/.local/share/applications/:$HOME/.config/composer/vendor/bin:$HOME/.local/bin/statusbar:/usr/local/bin:/usr/local/texlive/2023/bin/x86_64-linux:/usr/local/texlive/2023/bin/x86_64-linux:$PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
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
picom &
dwmblocks &
exec dwm
