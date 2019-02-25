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
" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" File switch from on to another
Plug 'ctrlpvim/ctrlp.vim'

"File Tree plugin NERDTree
Plug 'scrooloose/nerdtree'

" Auto complete plugin
Plug 'Valloric/YouCompleteMe'

Plug 'jiangmiao/auto-pairs'

"Snippets
Plug 'SirVer/ultisnips'

Plug 'majutsushi/tagbar'

" Code comment and decomment
Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'vim-syntastic/syntastic'

" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Python completion and tag navigation
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" ColorScheme
Plug 'tomasr/molokai'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()            " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','

"Disable up、down、left、right
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

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
" imap <c-s> <ESC>:w<CR>a

" Disable escape key in insert mode, <nop>(no operation)
inoremap jk <esc>

nnoremap <leader>q :q<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>w :w<cr>

" 解决插入模式下delete/backspce键失效问题
set backspace=2

" Set how many lines of history Vim has to remember
set history=1000

"Display the line number
set number

set autoread       " Reload files when changed

set textwidth=79   " Lines longer than 79 columns will be broken

" set ruler
set autoindent     " Align the new line indent with the previous line
set smartindent   
set tabstop=4      " Set number of spaces that a <Tab> in the file counts for
set softtabstop=4  " Insert/delete 4 spaces when hitting a TAB/BACKSPACE 
set expandtab      " Insert spaces when hitting TABs
set cindent
set shiftwidth=4   " Operation >> indents 4 columns; << unindents 4 columns 

" autocmd: specify commands to be executed automatically when reading or
" writing a file, when entering or leaving a buffer or window
" More information, please refer to:
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
autocmd BufRead,BufNewFile *.rb set shiftwidth=2  " If edit *.rb file,shiftwidth is 2; otherwise, it's 4
autocmd BufRead,BufNewFile *.rb set tabstop=2  " If edit *.rb file,shiftwidth is 2; otherwise, it's 4
autocmd BufRead,BufNewFile *.rb set softtabstop=2
" autocmd BufWritePre * :normal gg=G

" Set code folding method
set foldmethod=indent    " syntax
" Unfold when open file
set foldlevelstart=99
" press space to fold/unfold code
" nnoremap <space> za
" vnoremap <space> zf


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

" enable copy vim content to another application.
" vim --verision: must have xterm_clipboard support(install vim-gnome)
" set clipboard=unnamedplus

" Set git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
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
syntax on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" UltiSnips
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

" NERDTree
let NERDTreeWinSize=40

" ctrlP
let g:ctrlp_extensions = ['tag']

let g:ctrlp_working_path_mode='ra' " c: the directory of the current file; r: the nearest ancestor that contains one of these directories or files:.git .hg .svn .bzr

" Exclude files and directorys
" unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
			\ 'file': '\v\.(so|swap|tar|zip|jar|jpg|png|pdf|doc|docx|gz|bz2|rpm|deb)$',
			\}

" TagBar
set tags=./tags,tags;/
let g:tagbar_width=20   " Set tagbar window width

" Vim-airline
" let g:airline_powerline_fonts=1 " Let airline plugin use the arrow effect of powerline
"set vim statusbar theme
let g:airline_theme="molokai"

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouComepleteMe
" Set YouCompleteMe trigger key 
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_complete_in_comments = 1

" Syntax check
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Languages
let g:go_fmt_command = "goimports"

" Set shorcut key
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
" Stop automatic indentation when copied from another application at insert
" mode
" set pastetoggle=<F2>
