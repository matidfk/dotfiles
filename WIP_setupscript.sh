# copy dotfiles to home directory and set up git repo
cd
mkdir ~/.dotfiles
sudo pacman -S git
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles init
dotfiles remote add origin https://github.com/matidfk/dotfiles.git
dotfiles pull --set-upstream origin master
mkdir ~/.config/feh ~/.config/polybar ~/.config/picom ~/.config/rofi ~/.config/dunst

# install programs
sudo pacman -S \
xorg-server xorg-xinit libxft \
bspwm sxhkd \
picom polybar feh rofi dunst \
firefox discord kitty mpv \
xclip htop scrot alsa-utils man

# install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# get and enable ly login manager
yay -S ly
sudo systemctl enable ly

# TODO grub theme