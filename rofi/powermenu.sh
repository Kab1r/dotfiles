#!/usr/bin/env bash

THEME="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/powermenu.rasi"

rofi_command="rofi -no-config -theme $THEME"

# Options
o_shutdown=" Shutdown"
o_reboot=" Restart"
o_lock=" Lock"
o_suspend="鈴 Suspend"
o_logout=" Logout"

# Variable passed to rofi
options="$o_logout\n$o_reboot\n$o_shutdown\n$o_lock\n$o_suspend"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $o_shutdown)
        systemctl poweroff
        ;;
    $o_reboot)
        systemctl reboot
        ;;
    $o_lock)
        if [[ -f /usr/bin/i3lock ]]; then
            i3lock -i ~/Pictures/dracula-purplish-1080p.png
        elif [[ -f /usr/bin/betterlockscreen ]]; then
            betterlockscreen -l
        fi
        ;;
    $o_suspend)
        systemctl suspend
        ;;
    $o_logout)
        # $HOME/.config/leftwm/themes/current/down && pkill leftwm
	bspc query --nodes | while read -r winid; do
	    xdotool windowkill "$winid"
        done
	bspc quit 1
        ;;
esac
