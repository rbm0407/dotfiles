xbindkeys &
~/.local/src/dwm-bar/dwm_bar.sh &
systemctl --user import-environment DISPLAY &
exec dwm
