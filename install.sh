#!/bin/bash
#env variable
CONDIR=~/.config

#get sudo privilidges, idk the proper way to do it but this works if u have fast internet
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

#install stuff, commented shit is for testing
#sudo pacman -S --needed --noconfirm rxvt-unicode firefox rofi zsh btop micro mpv neofetch picom pacman-contrib feh base-devel
sudo pacman -S --needed --noconfirm zsh

#install yay
#mkdir ~/Documents
#cd ~/Documents
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si --noconfirm

#install aur packages
#yay -S --noconfirm spotify-adblock arrpc vencord-desktop-bin

#install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#install omz plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/cutom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#change shell
chsh /bin/zsh
