#! /bin/sh
# Usage: rofi -show lutris -modi lutris:rofi-lutris
# Tested with Lutris 0.5.3.

# Get the list of games from Lutris.
# The output is printed as a table with the following format:
# ID | Name                                     | Identifier                               | Runner          | ?
# 13 | Bayonetta                                | bayonetta                                | steam           | -
LUTRIS_GAMES="$(lutris -lo 2>/dev/null)"

# Store the (one-indexed) indices of relevant fields as variables.
NAME_FIELD_INDEX="2"
IDENTIFIER_FIELD_INDEX="3"

# Given a row/list of rows from `lutris lo` and a field index,
# for each row, return the value of the specified field with
# leading and trailing whitespace removed.
select_field_by_index() {
    ROWS="$1"
    FIELD_INDEX="$2"
    echo "$ROWS" | awk -F "|" "{print \$$FIELD_INDEX}" | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//'
}

# Output the names for all games in the Lutris database.
names() {
    select_field_by_index "$LUTRIS_GAMES" "$NAME_FIELD_INDEX"
}

# Retrieve the identifier for a game by its display name.
get_identifier_from_name() {
    SELECTED_GAME_NAME="$1"

    while read -r GAME; do
        GAME_NAME="$(select_field_by_index "$GAME" "$NAME_FIELD_INDEX")"
        if [ "$SELECTED_GAME_NAME" == "$GAME_NAME" ]; then
            select_field_by_index "$GAME" "$IDENTIFIER_FIELD_INDEX"
        fi
    done <<< "$LUTRIS_GAMES"
}

# If the script has been called without arguments, print the list
# of names for games in the Lutris database. Otherwise, launch the
# game with the provided name in the background.
if [[ -z "$@" ]]; then
    names
else
    SELECTED_GAME_ID="$(get_identifier_from_name "$@")"
    lutris "lutris:rungame/$SELECTED_GAME_ID" > /dev/null 2>&1 &
    exit
fi
