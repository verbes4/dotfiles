#!/bin/bash
CONFDIR=~/.config

mv .zshrc ~/.zshrc
mv .Xresources ~/.Xresources
cd Pictures
mv 1689327828382530.png ~/Pictures/1689327828382530.png
cd ..
mv .local/share/rofi ~/.local/share/rofi

cd .config
mv Vencord $CONFDIR/Vencord
mv btop $CONFDIR/btop
rm $CONFDIR/i3
mv i3 $CONFNDIR/i3
rm $CONFDIR/i3blocks
mv i3blocks $CONFDIR/i3
mv micro $CONFDIR/micro
mv mpv $CONFDIR/mpv
mv neofetch $CONFDIR/neofetch
mv picom $CONFDIR/picom
mv rofi $CONFDIR/rofi
mv spotify $CONFDIR/spotify

sudo pacman -S --noconfirm rxvt firefox rofi zsh btop micro mpv neofetch picom pacman-contrib
