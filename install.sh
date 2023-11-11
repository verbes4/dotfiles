#!/bin/bash
#env variable
CONDIR=~/.config

#get sudo privilidges, idk the proper way to do it
echo "Elevate privilidges"
sudo sleep 1

#move all the config stuff that isnt in .config
mv .zshrc ~/.zshrc
mv .Xresources ~/.Xresources
mv Pictures ~
mkdir ~/.local/share/
mv .local/share/rofi ~/.local/share/rofi

#move all the config stuff that IS in .config
cd .config
mv VencordDesktop $CONDIR/VencordDesktop
mv btop $CONDIR/btop
rm -rf $CONDIR/i3
mv i3 $CONDIR/i3
mv i3blocks $CONDIR/i3
mv micro $CONDIR/micro
mv mpv $CONDIR/mpv
mv neofetch $CONDIR/neofetch
mv picom $CONDIR/picom
mv rofi $CONDIR/rofi
mv spotify $CONDIR/spotify

#install stuff
sudo pacman -S --needed --noconfirm rxvt-unicode firefox rofi zsh btop micro mpv neofetch picom pacman-contrib feh base-devel

#install yay
mkdir ~/Documents
cd ~/Documents
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#install aur packages
yay -S --noconfirm spotify-adblock arrpc vencord-desktop-bin

#install oh-my-zsh
