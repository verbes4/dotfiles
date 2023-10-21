#!/bin/bash
CONFDIR=~/.config

echo "Elevate priviilges"
sudo sleep 1

mv .zshrc ~/.zshrc
mv .Xresources ~/.Xresources
cd Pictures
mkdir ~/Pictures/
mv 1689327828382530.png ~/Pictures/1689327828382530.png
cd ..
mkdir ~/.local/share/
mv .local/share/rofi ~/.local/share/rofi

cd .config
mv Vencord $CONFDIR/Vencord
mv btop $CONFDIR/btop
rm -rf $CONFDIR/i3
mv i3 $CONFDIR/i3
mv i3blocks $CONFDIR/i3
mv micro $CONFDIR/micro
mv mpv $CONFDIR/mpv
mv neofetch $CONFDIR/neofetch
mv picom $CONFDIR/picom
mv rofi $CONFDIR/rofi
mv spotify $CONFDIR/spotify

sudo pacman -S --noconfirm rxvt-unicode firefox rofi zsh btop micro mpv neofetch picom pacman-contrib feh
