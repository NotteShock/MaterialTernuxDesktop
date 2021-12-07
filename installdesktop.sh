#! $PREFIX/bin/ bash

GREEN="\e[32m"
ENDCOLOR="\e[0m"

## Ask the user if the user want to install the desktop or not

clear && read -p "Do you want to install the desktop? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "
You choose to install the desktop"
echo -e "${GREEN}
(•) Installing the desktop...
${ENDCOLOR}"
apt install unstable-repo x11-repo
apt install kvantum xarchiver git audacious papirus-icon-theme xpdf xfce4-whiskermenu-plugin xfce4-terminal xfce4-panel-profiles qt5-qtbase-gtk-platformtheme qt5-qtx11extras xfce4 qt5ct otter-browser qgit featherpad gtk2 gtk3 python-tkinter tigervnc xorg-xhost geany qt5-qtwebsockets qt5-qtxmlpatterns qt5-qtdeclarative termux-api geany-plugins xorg-xprop neofetch sl texlive-roboto galculator qt5-qttools feathernotes xorg-xprop xorg-xhost -y
wget https://raw.githubusercontent.com/NotteShock/material-termux-desktop/main/themes.tar.gz
tar -xf themes.tar.gz -C $PREFIX/share/themes/
wget -qO- https://raw.githubusercontent.com/NotteShock/material-termux-desktop/master/install-materia-kde.sh | sh
wget https://raw.githubusercontent.com/NotteShock/material-termux-desktop/main/startdesktop.sh
wget https://raw.githubusercontent.com/NotteShock/material-termux-desktop/main/stopdesktop.sh
mkdir $HOME/Desktop
mkdir $HOME/Downloads
mkdir $HOME/Templates
mkdir $HOME/Public
mkdir $HOME/Documents
mkdir $HOME/Video
chmod +x *.sh
bash startdesktop.sh
rm -rf installdesktop.sh themes.tar.gz install-materia-kde.sh

elif [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "
Action cancelled by user"
else
    echo "
Invaild response!"
fi
