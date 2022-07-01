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

" ripgrep required when using Rg search
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
" Plug 'majutsushi/tagbar'

" refer: https://github.com/neoclide/coc-snippets
Plug 'honza/vim-snippets'
Plug 'vim-syntastic/syntastic'

Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" LSP client
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'

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

inoremap jk <esc>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>qq :q!<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" Moving to matching braces, refer: https://vim.fandom.com/wiki/Moving_to_matching_braces
nnoremap % v%

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312
set guifont=*

" set ruler
set autoindent     " Align the new line indent with the previous line
set smartindent   
set tabstop=4      " Set number of spaces that a <Tab> in the file counts for
set softtabstop=4  " Insert/delete 4 spaces when hitting a TAB/BACKSPACE 
set expandtab      " Insert spaces when hitting TABs
set cindent
set shiftwidth=4   " Operation >> indents 4 columns; << unindents 4 columns

set number
set showcmd
set mouse=a
set autoread       " Reload files when changed
set hidden
set noswapfile
set path=.,**,,
set wildmenu
set backspace=2
set history=1000
" set textwidth=120   " Lines longer than 120 columns will be broken
set completeopt=menu,menuone

" enable copy vim content to another application.
set clipboard=unnamed " set clipboard=unnamedplus

" Set git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72
" petty format json, just type gg=G
autocmd FileType json setlocal equalprg=jq\ .

set foldmethod=indent    " syntax
set foldlevelstart=99
nnoremap <space> za

set cmdheight=2
set updatetime=300
set shortmess+=c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set the colortheme of vim
colorscheme molokai
syntax on

" set colorcolumn=120
set hlsearch
set incsearch

" Status line config
set laststatus=2  "Always show the status line
set t_Co=256

" Highlight the current line
set cursorline
hi CursorLine cterm=NONE ctermbg=brown ctermfg=white guibg=darkmagenta guifg=white

set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>

" NERDTree
let NERDTreeWinSize=40

" TagBar
set tags=./tags,tags;/
let g:tagbar_width=20   " Set tagbar window width

" Vim-airline
let g:airline_theme="molokai"

" Syntax check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

let g:syntastic_c_checkers = ['clang-check']
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = 'clang'
" automatic checks for filetypes in the active_filetypes when in passive mode
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["c", "rust"],
        \ "passive_filetypes": ["puppet"] }

" Languages
let g:rustfmt_autosave = 1

" https://github.com/golang/tools/blob/master/gopls/doc/vim.md
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command = 'gopls'


" fzf.vim
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nmap <silent> <leader>f :Files<CR>
nmap <silent> <C-f> :Rg<CR>
nmap <silent> <leader>b :Buffer<CR>
nmap <silent> <leader>g :Commits<CR>
nmap <silent> <leader>h :History<CR>
nmap <silent> <leader>H :Helptags<CR>
nmap <silent> cc :Commands<CR>

" five kinds of layout: window/down/up/left/right
let g:fzf_layout = {'down': '~60%'}
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" ALE
let g:ale_linters = {
            \'rust': ['analyzer'],
            \'go': ['gopls']
            \}
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1

nmap <silent> <leader>gd :ALEGoToDefinition<CR>
nmap <silent> <leader>fr :ALEFindReferences<CR>
nmap <silent> <leader>ss :ALESymbolSearch<CR>
nmap <silent> <leader>re :ALERename<CR>
imap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
