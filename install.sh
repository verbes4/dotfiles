#!/bin/bash

#TO DO: manually install libnsl because for some reason pacman gets a 404 when it tries to install it
#test around more to see if/why .config/i3/config wont work (i3 asks to generate new one on relog)
#make chsh work, it doesnt recognise /bin/zsh being there when it is
#just test everything

#env variable
export CONDIR=~/.config
export DOTFILES="$(pwd)"

#get sudo privilidges, idk the proper way to do it but this works if u have fast internet
echo "Elevate privilidges"
sudo sleep 1

#move all the config stuff that isnt in .config
echo "moving config files outside .config"
mv .zshrc ~/.zshrc
mv .Xresources ~/.Xresources
mv Pictures ~
mkdir ~/.local/share/
mv .local/share/rofi ~/.local/share/rofi

#move all the config stuff that IS in .config
cd .config
echo "moving .config files"
mv VencordDesktop $CONDIR/VencordDesktop
mv btop $CONDIR/btop
rm -rf $CONDIR/i3/config
mv i3/config $CONDIR/i3/config
mv i3blocks $CONDIR/i3blocks
mv micro $CONDIR/micro
mv mpv $CONDIR/mpv
mv neofetch $CONDIR/neofetch
mv picom $CONDIR/picom
mv rofi $CONDIR/rofi
mv spotify $CONDIR/spotify

#install yay
echo "installing yay"
mkdir ~/Documents
cd ~/Documents
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

#install libnsl hopefully?
echo "installing libnsl"
cd $DOTFILES
wget "https://archlinux.org/packages/core/x86_64/libnsl/download/"
mv index.html libnsl.pkg.tar.zst #weird workaround to make it not corrupted lol
sudo pacman -U --noconfirm libnsl.pkg.tar.zst

#install aur packages
echo "installing packages"
#yay -S --noconfirm spotify-adblock arrpc vencord-desktop-bin rxvt-unicode firefox rofi zsh btop micro mpv neofetch picom pacman-contrib feh base-devel
yay -S --needed --noconfirm zsh rxvt-unicode rofi feh picom

#install oh-my-zsh
echo "installing omz"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#install omz plugins
echo "installing omz plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#change shell, doesnt work bc chsh is being weird
chsh /bin/zsh
