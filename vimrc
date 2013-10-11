"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc is based on the the vimrc of Amix:
" 	http://amix.dk/vim/vimrc.html
" I really like his style,but I also add my own features
" such as vundle,ctrlp,ultisnips,etc.
"
"Author:xautjzd
"Homepage:http://xautjzd.github.com
"Email:xautjzd@gmail.com
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               "disable vi compatibility
filetype off                   "required!

set rtp+=~/.vim/bundle/vundle/  "set runtimepath
call vundle#rc()

" let Vundle manage Vundle  
Bundle 'gmarik/vundle'

"File Tree plugin NERDTree
Bundle 'scrooloose/nerdtree'

"File switch from on to another
Bundle 'kien/ctrlp.vim'

"My Bundles here
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'

"vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

"snippets
Bundle 'SirVer/ultisnips'
"Bundle 'vim-scripts/snipMate'
" Bundle 'm2ym/rsense'

"Syntax highlight
Bundle 'cucumber.zip'
Bundle 'Markdown'

"Utility
Bundle 'majutsushi/tagbar'
"auto complete plugin
Bundle 'Valloric/YouCompleteMe'
"Bundle 'SuperTab'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'file-line'

"code comment and decomment
Bundle 'tomtom/tcomment_vim'

"ColorScheme
Bundle 'tomasr/molokai'

"Airline
Bundle 'bling/vim-airline'

"Navigation
Bundle "http://github.com/gmarik/vim-visual-star-search.git"


"Enable filetype plugins
filetype indent plugin on     "enable loading the plugin files for specific file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Disable up、down
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


"Set how many lines of history Vim has to remember
set history=1000

"Display the line number
set number

set autoindent
set smartindent   
set autoread       "reload files when changed

" set ruler
" set expandtab
set tabstop=2      "set tab width
set shiftwidth=2   "set width of nested tabs(set indent width)

" set code folding method
set foldmethod=syntax

" set backspace=2    "设置退格键
set cindent shiftwidth=2  "自动缩进4空格

"Automatically append closing characters
inoremap ( ()<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

set showcmd

" set vim default display encode
set encoding=utf-8
"set file encoding when save or new file
set fileencoding=utf-8
"file encode list,when vim read file,it will detect according to this config
set fileencodings=utf-8,gbk,gb2312
" set guifont=*

"set vim statusbar theme
let g:airline_theme="molokai"
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline#extensions#branch#symbol = ' '
" let g:airline#extensions#readonly#symbol = ''
" let g:airline_linecolumn_prefix = ' '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Highlight the current line
set cursorline

"Highlight the search result and incremental search
set hlsearch
set incsearch

"Status line config
set laststatus=2  "Always show the status line
set noshowmode
set t_Co=256

let g:airline_powerline_fonts=1

"Set the colortheme of vim
colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Inc_Winwidth=0
let Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
set autochdir

"Set tagbar window width
let g:tagbar_width=20

"Set YouCompleteMe trigger key 
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']


"Set shorcut key
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>


