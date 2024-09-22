#!/bin/sh

rofi_command="rofi -theme $HOME/.config/rofi/power/config.rasi -p "power""

#### Options ###
log_out=""
suspend=""
lock=""
reboot=" "
power_off=" "
# Variable passed to rofi
options="$log_out\n$suspend\n$lock\n$reboot\n$power_off"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $lock)
        i3lock -i /home/vacuum/Pictures/Wallpapers/blurlock.png
        ;;    
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
    $log_out)
        i3-msg exit
        ;;
esac

