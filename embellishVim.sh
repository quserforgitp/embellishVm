#!/usr/bin/env bash

COLS=$(tput cols)
LINES=$(tput lines)
echo "COLUMNAS: $COLS LINEAS $LINES"

if [ $COLS -lt 97 ]; then
    echo "Por favor maximice la pantalla para mejor visualizacion del verbose"
    echo "por lo menos a 97 COLUMNAS (-> en esta direccion de la pantalla)"
    exit 0
fi

clear
echo
echo "███████╗███╗   ███╗██████╗ ███████╗██╗     ██╗     ██╗███████╗██╗  ██╗    ██╗   ██╗██╗███╗   ███╗"
echo "██╔════╝████╗ ████║██╔══██╗██╔════╝██║     ██║     ██║██╔════╝██║  ██║    ██║   ██║██║████╗ ████║"
echo "█████╗  ██╔████╔██║██████╔╝█████╗  ██║     ██║     ██║███████╗███████║    ██║   ██║██║██╔████╔██║"
echo "██╔══╝  ██║╚██╔╝██║██╔══██╗██╔══╝  ██║     ██║     ██║╚════██║██╔══██║    ╚██╗ ██╔╝██║██║╚██╔╝██║"
echo "███████╗██║ ╚═╝ ██║██████╔╝███████╗███████╗███████╗██║███████║██║  ██║     ╚████╔╝ ██║██║ ╚═╝ ██║"
echo "╚══════╝╚═╝     ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝"
echo 
echo " _                          _         _   _   _                  "
echo "| |__  _   _        __ _   / \  _   _| |_| | | | ___  _ __ _ __  "
echo "| '_ \| | | |      / _\` | / _ \| | | | __| |_| |/ _ \| '__| '_ \ "
echo "| |_) | |_| |     | (_| |/ ___ \ |_| | |_|  _  | (_) | |  | |_) |"
echo "|_.__/ \__, |      \__, /_/   \_\__,_|\__|_| |_|\___/|_|  | .__/ "
echo "       |___/          |_|                                 |_|    "
                                                                                                 

echo $(tput civis)

echo
echo
echo -n "$(tput setaf 6)[!]$(tput sgr0) Checking for dependencies"
sleep 1s
echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n "."
sleep 1s
echo
echo

# is git installed?
if command -v git >/dev/null 2>&1 ; then
    echo "$(tput setaf 2)[*]$(tput sgr0) git found !!!"
    sleep 3s

else
    echo "$(tput setaf 1)[*]$(tput sgr0) git not found "
    echo -n "$(tput setaf 6)[!]$(tput sgr0) Attemping to install git package"
    echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n ".";echo
    sudo apt update
    sudo apt install git -y    
    echo $(tput cnorm)
fi

echo $(tput civis)
sleep 2s


# is Vundle installed?
if [ -d ~/.vim/bundle/Vundle.vim ] ; then
    echo "$(tput setaf 2)[*]$(tput sgr0) Vundle found !!!"
    sleep 3s

else
    echo "$(tput setaf 1)[*]$(tput sgr0) Vundle not found "
    echo -n "$(tput setaf 6)[!]$(tput sgr0) Attemping to cloning Vundle (git plugin manager)"
    echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n ".";echo
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim    
fi

echo
echo  "$(tput setaf 9)[!!!]$(tput sgr0) Just a little last step by your own!!"
echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n ".";echo
sleep 3s
echo "Copy the content of the"
sleep 2s
echo "         $(tput bold) https://github.com/danebulat/vim-config/blob/master/light-ide/vimrc $(tput sgr0)"
echo "file"
sleep 3s
echo  "into your $(tput blink)~/.vimrc $(tput sgr0) and then run vim "
sleep 2s
echo  "and finally execute the following command in vim's normal mode (ESC)"
sleep 3s
echo "                      $(tput blink setaf 2):PluginInstall$(tput sgr0)"
sleep 2s
read -p "Press ENTER to continue..."
echo
echo "$(tput bold setaf 2)EnJoy Typing code in your New ToY BoY !!!!$(tput sgr0)"
echo $(tput cnorm)
exit 0
