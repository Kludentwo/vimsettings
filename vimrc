call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'jceb/vim-orgmode', { 'branch': 'v0.6.0' }
Plug 'mfukar/robotframework-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/vim-kconfig'
call plug#end()

set nocp
set history=700
set so=7

" Enable filetype plugins
filetype plugin on
filetype indent on

set ruler
set cmdheight=2

set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw

set magic

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set noexpandtab

set shiftwidth=8
set softtabstop=8
set tabstop=8

set ai
set si
set nowrap

set laststatus=2

set number
"highlight LineNr term=bold cterm=NONE ctermfg=blue ctermbg=NONE gui=NONE guifg=blue guibg=NONE

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

function! DelTagOfFile(file)
	let fullpath = a:file
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let f = substitute(fullpath, cwd . "/", "", "")
	let f = escape(f, './')
	let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
	let resp = system(cmd)
endfunction

function! UpdateTags()
	let f = expand("%:p")
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
	call DelTagOfFile(f)
	let resp = system(cmd)
endfunction

autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()

autocmd BufWritePre *.cpp,*.h,*.c :%s/\s\+$//e

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:netrw_liststyle=3

let maplocalleader = "½"

