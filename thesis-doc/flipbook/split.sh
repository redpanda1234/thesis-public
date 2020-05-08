#!/bin/zsh
ffmpeg -i Construct72-2.mp4 -r 60/2 frames/$filename%d.png
