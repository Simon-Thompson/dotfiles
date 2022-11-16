#! /bin/sh

rofi_command="rofi -p "media""

#### Options ###
games="  Games"
manga="  Manga"
# Variable passed to rofi
options="$games\n$manga"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $games)
        GAME_LAUNCHER_CACHE=$HOME/.cache/rofi-game-launcher
        $HOME/.config/rofi/media/games/scripts/update-game-entries.sh -q &

        (
            # Temporarily overwrite XDG_DATA_HOME so that Rofi looks for
            # .desktop files in $GAME_LAUNCHER/applications instead of
            # ~/.local/share/applications
            export XDG_DATA_HOME=$GAME_LAUNCHER_CACHE
            rofi -show drun -theme $HOME/.config/rofi/media/games/games.rasi -drun-categories SteamLibrary \
                 -cache-dir $GAME_LAUNCHER_CACHE
        )

        # Emulate most recently used history by resetting the count
        # to 0 for each application
        sed -i -e 's/^1/0/' $GAME_LAUNCHER_CACHE/rofi3.druncache
        ;;
    $manga)
        $HOME/.config/rofi/media/manga/rofi-manga.sh
        ;;
esac

