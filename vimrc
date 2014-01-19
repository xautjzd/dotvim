""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc is based on the the vimrc of Amix:
" 	http://amix.dk/vim/vimrc.html
" I really appreciate his configurattion, but I also add my own features
" such as vundle,ctrlp,ultisnips,etc.
"
" Author: xautjzd
" Homepage: http://xautjzd.github.com
" Email: xautjzd@gmail.com
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               "disable vi compatibility
filetype off                   "required!

set rtp+=~/.vim/bundle/vundle/  "set runtimepath
call vundle#rc()

" Let Vundle manage Vundle  
Bundle 'gmarik/vundle'

"File Tree plugin NERDTree
Bundle 'scrooloose/nerdtree'

"File switch from on to another
Bundle 'kien/ctrlp.vim'

"snippets
Bundle 'SirVer/ultisnips'
"Bundle 'vim-scripts/snipMate'

" Auto complete plugin
Bundle 'Valloric/YouCompleteMe'
" Bundle 'Shougo/neocomplcache.vim'
"Bundle 'SuperTab'

" Code comment and decomment
Bundle 'tomtom/tcomment_vim'

Bundle 'majutsushi/tagbar'

" Static syntax checking
Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" ColorScheme
Bundle 'tomasr/molokai'

"Airline
Bundle 'bling/vim-airline'

" Utility
" Bundle 'repeat.vim'
Bundle 'tpope/vim-surround'

Bundle 'junegunn/goyo.vim'

Bundle 'plasticboy/vim-markdown'

"Enable filetype plugins
filetype indent plugin on     " Enable loading the plugin files for specific file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Disable up、down、left、right
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

let mapleader=','

" Edit my vimrc file through <leader>ev default leader is \
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Take the contents of given file and execute it in Vimscript, default $MYVIMRC is ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Type <leader>" vim will surround the word in double quotes
" nnoremap <leader>" bi"<esc>lwa"<esc>l

"Automatically append closing characters
" inoremap ( ()<Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

" To save, press <c-s>
nmap <c-s> :w<CR>
imap <c-s> <ESC>:w<CR>a

" Disable escape key in insert mode, <nop>(no operation)
inoremap jk <esc>

nnoremap <leader>q :q<cr>
inoremap <leader>w <esc>:w<cr>

" Ctrl+d delete the current line in insert mode
inoremap <c-d> <esc>ddi

" Set how many lines of history Vim has to remember
set history=1000

"Display the line number
set number

set autoindent
set smartindent   
set autoread       " Reload files when changed

" set ruler
" set expandtab
set tabstop=4      " Set number of spaces that a <Tab> in the file counts for
set cindent
set shiftwidth=4   " Set width of nested tabs,control  how many columns text is indented with the reindent operations(<<)

" autocmd: specify commands to be executed automatically when reading or
" writing a file, when entering or leaving a buffer or window
" More information, please refer to:
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
autocmd BufRead,BufNewFile *.rb set shiftwidth=2  " If edit *.rb file,shiftwidth is 2; otherwise, it's 4
autocmd BufRead,BufNewFile *.rb set tabstop=2  " If edit *.rb file,shiftwidth is 2; otherwise, it's 4
" autocmd BufWritePre * :normal gg=G

" Set code folding method
set foldmethod=syntax


" When setting showcmd, the bottom line will show you information about the
" current command going on
set showcmd

" Set vim default display encode
set encoding=utf-8
"set file encoding when save or new file
set fileencoding=utf-8
"file encode list,when vim read file,it will detect according to this config
set fileencodings=utf-8,gbk,gb2312
" set guifont=*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the current line
set cursorline

"Highlight the search result and incremental search
set hlsearch
set incsearch

" Status line config
set laststatus=2  "Always show the status line
set t_Co=256

"Set the colortheme of vim
colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" UltiSnips
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

" NERDTree
let NERDTreeWinSize=20

" CtrlP
let g:ctrlp_working_path_mode='ra' " c: the directory of the current file; r: the nearest ancestor that contains one of these directories or files:.git .hg .svn .bzr

" Exclude files and directorys
" unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
			\ 'file': '\v\.(so|swap|tar|zip|jar|jpg|png|pdf|doc|docx|gz|bz2|rpm|deb)$',
			\}


" TagList
let Tlist_Inc_Winwidth=0
let Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
set autochdir

" TagBar
let g:tagbar_width=20   " Set tagbar window width

" Vim-airline
" More airline-customization please refer to vim-airline doc:
" https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1 " Let airline plugin use the arrow effect of powerline
let g:airline_detect_whitespace=0 " *trailing[164] is part of the whitespace extension, disable it  
"set vim statusbar theme
let g:airline_theme="molokai"

" YouComepleteMe
" Set YouCompleteMe trigger key 
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" Enable NeoComplCache
" let g:neocomplcache_enable_at_startup=1

" Syntastic plugin
" check header files for C
let g:Syntastic_c_check_header = 1
let syntastic_mode_map = { 'passive_filetypes': ['html'] } " don't check html

" Goyo
function! g:goyo_before()
	silent !tmux set status off
endfunction

function! g:goyo_after()
	silent !tmux set status on
endfunction

let g:goyo_callbacks = [function('g:goyo_before'), function('g:goyo_after')]
noremap <leader>g :Goyo<CR>

" Vim-markdown
let g:vim_markdown_folding_disabled=1

" Set shorcut key
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>  " ruby syntax gets checked on pressing <F9> key
