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

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Plug 'junegunn/fzf.vim'
" Install rg first, https://github.com/BurntSushi/ripgrep https://hackercodex.com/guide/vim-search-find-in-project/
Plug 'mileszs/ack.vim'

"File Tree plugin NERDTree
Plug 'scrooloose/nerdtree'
" Plug 'majutsushi/tagbar'

" refer: https://github.com/neoclide/coc-snippets
Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs'
" Code comment and decomment
Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" LSP client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Python completion and tag navigation
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'vim-syntastic/syntastic'

" ColorScheme
Plug 'tomasr/molokai'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on         " 开启文件类型侦测
filetype plugin on  " 根据侦测到的不同类型加载对应的插件
filetype indent on

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

" Disable escape key in insert mode, <nop>(no operation)
inoremap jk <esc>

nnoremap <leader>q :q<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>w :w<cr>
" Moving to matching braces, refer: https://vim.fandom.com/wiki/Moving_to_matching_braces
nnoremap % v%

" 解决插入模式下delete/backspce键失效问题
set backspace=2

" Set how many lines of history Vim has to remember
set history=1000

set mouse=a

"Display the line number
set number

set autoread       " Reload files when changed

" set textwidth=120   " Lines longer than 120 columns will be broken

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
" Set git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

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
set guifont=*

" enable copy vim content to another application. 
set clipboard=unnamed " set clipboard=unnamedplus

set cmdheight=2
set updatetime=300
set shortmess+=c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set the colortheme of vim
colorscheme molokai
syntax on           " 允许用指定语法高亮配色方案替换默认方案

set hlsearch        " Highlight the search result
set incsearch       " Realtime search
" Status line config
set laststatus=2  "Always show the status line
set t_Co=256

set cursorline      " Highlight the current line
hi CursorLine cterm=NONE ctermbg=brown ctermfg=white guibg=darkmagenta guifg=white

match ErrorMsg '\%>80v.\+' " Highlight long lines over than 80 characters

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeWinSize=40

" TagBar
set tags=./tags,tags;/
let g:tagbar_width=20   " Set tagbar window width

" Vim-airline
" let g:airline_powerline_fonts=1 " Let airline plugin use the arrow effect of powerline
"set vim statusbar theme
let g:airline_theme="molokai"

" Syntax check
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

 let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
 let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

" automatic checks for filetypes in the active_filetypes when in passive mode
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["c"],
        \ "passive_filetypes": ["puppet"] }

" Languages
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

" Set shorcut key
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
" Stop automatic indentation when copied from another application at insert
" mode
" set pastetoggle=<F2>

" <leader>fm 搜索最近使用过的文件
nnoremap <leader>fm :Leaderf mru<CR>
" <leader>fc 搜索历史命令
nnoremap <leader>fc :Leaderf cmdHistory<CR>


" Ack.vim Prefer rg > ag > ack
if executable('rg')
    let g:ackprg = 'rg -S --no-heading --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" Backslash invokes ack.vim
nnoremap \ :Ack<SPACE>

" coc.vim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
