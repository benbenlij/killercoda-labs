#!/bin/bash

files=("/home/john/meme.jpg" "/home/catherine/.secret_video.mp4" "/home/verity/songs" "/home/verity/songs/verity_song.wav")
for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        exit 1
    fi
done

exit 0