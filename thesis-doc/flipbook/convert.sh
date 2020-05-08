#!/bin/zsh

cd frames
rm crop*.png

for file in *.png; do
    convert "$file" -crop 1000x1000+800+230 -white-threshold 10% -negate "crop_$file";
done


# Also a terrible hack but cp the end frame a few times because my
# thesis somehow got longer than 212 pages
cp crop_212.png crop_213.png
cp crop_212.png crop_214.png
cp crop_212.png crop_215.png
cp crop_212.png crop_216.png
cp crop_212.png crop_217.png
cp crop_212.png crop_218.png
cp crop_212.png crop_219.png
cp crop_212.png crop_220.png
cp crop_212.png crop_221.png
cp crop_212.png crop_222.png

cd ..
