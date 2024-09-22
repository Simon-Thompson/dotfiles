#! /bin/sh

cd $(dirname $(realpath $0))

case "$1" in
    drun)       rofi -modi drun,run -show drun;;
    windows)    rofi -modi window -show window -kb-accept-entry 'space,Return';;
    power)      ./power/rofi-power.sh;;
    media)      ./media/rofi-media.sh;;
    files)      ./files/rofi-files.sh;;
    utilities)  ./utilities/rofi-utilities.sh;;
esac
