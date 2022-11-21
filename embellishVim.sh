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

# is vim installed?
if command -v vim >/dev/null 2>&1 ; then
    echo "$(tput setaf 2)[*]$(tput sgr0) vim found !!!"
    sleep 3s

else
    echo "$(tput setaf 1)[*]$(tput sgr0) vim not found "
    echo -n "$(tput setaf 6)[!]$(tput sgr0) Attemping to install vim package"
    echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n ".";echo
    sudo apt update
    sudo apt install vim -y    
    echo $(tput cnorm)
fi


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
echo  "$(tput setaf 9)[!!!]$(tput sgr0) Generating the ~/.vimrc file"
echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n ".";echo
sleep 1s
cat >> ~/.vimrc <<- EOF
" HIGHLIGHTING IDE
" ------------------------------------------------------------
" Load plugins
" ------------------------------------------------------------

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins will be downloaded under the specified directory.
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colorschemes
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'sjl/badwolf'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scheakur/vim-scheakur'
Plugin 'Badacadabra/vim-archery'

" PloyGlot
Plugin 'sheerun/vim-polyglot'

" Auto Pairs
Plugin 'jiangmiao/auto-pairs'   

" NERDTree
Plugin 'preservim/nerdtree'

" Tagbar
Plugin 'preservim/tagbar'

" ctrlsf.vim 
Plugin 'dyng/ctrlsf.vim'

" vim-fswitch
Plugin 'derekwyatt/vim-fswitch'

" vim-protodef 
Plugin 'derekwyatt/vim-protodef'

" List ends here. Plugins become visible to Vim after this call.
call vundle#end()
filetype plugin indent on


" ------------------------------------------------------------
" auto-pairs configuration
" ------------------------------------------------------------

let g:AutoPairsShortcutToggle = '<C-P>'


" ------------------------------------------------------------
" NERDTree configuration
" ------------------------------------------------------------

let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31


" ------------------------------------------------------------
" tagbar configuration
" ------------------------------------------------------------

let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'


" ------------------------------------------------------------
" ctrlsf configuration
" ------------------------------------------------------------

let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_close = { "normal": 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view = 'normal'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '46'
let g:ctrlsf_default_root = 'cwd'   " projcet


" ------------------------------------------------------------
" fswitch configuration
" ------------------------------------------------------------
"
" Set fswichdst and fswitchloc variables when BufEnter event takes place
" on a file whose name matches {*.cpp}.

au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h   let b:fswitchdst = 'cpp,c'

" fswitchdst  - Denotes the files extensions that is the target extension of
"               the current file's companion file.
"
" fswitchlocs - Contains a set of directories that indicate directory names 
"               that should be formulated when trying to find the alternate
"               file.

" ------------------------------------------------------------
" vim-protodef configuration 
" ------------------------------------------------------------

nmap <buffer> <silent> <leader> ,PP
nmap <buffer> <silent> <leader> ,PN

" NOTE: This doesn't seem to disable the sorting.
let g:disable_protodef_sorting = 1


" ------------------------------------------------------------
" Vim configuration
" ------------------------------------------------------------

set nu                  " Enable line numbers
syntax on               " Enable synax highlighting
set incsearch           " Enable incremental search
set hlsearch            " Enable highlight search
set splitbelow          " Always split below"
set mouse=a             " Enable mouse drag on window splits
set tabstop=4           " How many columns of whitespace a \t is worth
set shiftwidth=4        " How many columns of whitespace a “level of indentation” is worth
set expandtab           " Use spaces when tabbing

if !has('nvim')
    set termwinsize=12x0    " Set terminal size
endif

set background=dark     " Set background 

" ------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------

" General
nmap        <C-B>     :buffers<CR>
nmap        <C-J>     :term<CR>

" NERDTree
nmap        <F2>      :NERDTreeToggle<CR>

" tagbar
nmap        <F8>      :TagbarToggle<CR>

" ctrlds
nmap        <C-F>f    <Plug>CtrlSFPrompt
xmap        <C-F>f    <Plug>CtrlSFVwordPath
xmap        <C-F>F    <Plug>CtrlSFVwordExec
nmap        <C-F>n    <Plug>CtrlSFCwordPath
nmap        <C-F>p    <Plug>CtrlSFPwordPath
nnoremap    <C-F>o    :CtrlSFOpen<CR>
nnoremap    <C-F>t    :CtrlSFToggle<CR>
inoremap    <C-F>t    <Esc>:CtrlSFToggle<CR>

" fswitch
nmap        <C-Z>     :vsplit <bar> :wincmd l <bar> :FSRight<CR>









"""	MAP KEYS
let mapleader = "\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>



"""	SET VALUES
set title
"syntax on
"set autoindent
"set cursorline
"set cursorcolumn
EOF

echo -n "$(tput setaf 6)[!]$(tput sgr0) Attemping to install Vim pluggins"
    echo -n "."; sleep 1s; echo -n ".";sleep 1s; echo -n ".";echo
    vim +PluginInstall +qall

cat >> ~/.vimrc <<- EOF
colorscheme badwolf    " Set color scheme
EOF


read -p "Press ENTER to continue..."
echo
echo "$(tput bold setaf 2)EnJoy Typing code in your New ToY BoY !!!!$(tput sgr0)"
echo $(tput cnorm)
exit 0
