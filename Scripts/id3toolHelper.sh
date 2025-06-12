#!/bin/sh
keyword="kick"

GetTitle() { id3tool "$1" | sed -n 's|^Song Title:\t||p'; }
GetArtist() { id3tool "$1" | sed -n 's|^Artist:\t||p'; }
PrintArtist() {
    local file="$1"
    artist=$(GetArtist "$file")
    if [ -n "$artist" ]; then
        echo "File: $file - Artist: $artist"
    fi
}

for file in *.mp3; do 
    PrintArtist "$file"
done
