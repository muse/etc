" Author: `Mirko van der Waal`
"  Email: `<mvdw at airmail dot cc>`

" Pathogenetic.
"
" Executable: `$ bundler`
" Repository: `bundler.repo`
 execute pathogen#infect()
filetype plugin indent on
  syntax on
  colors nocturnal

" Configuration.
"" Runtimepath
set rtp+=~/.fzf

"" Encoding.
set termencoding=utf-8
set encoding=utf8

"" Wildmenu.
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.tmp

"" Title.
set title
set titlestring=%t:%l%r%m
set titlelen=24

"" Undo.
set undofile
set undodir=~/.vim/undo,/tmp
set undolevels=1024
set undoreload=1024

"" Column, tab and text width.
set colorcolumn=80
set textwidth=80
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

"" Horizontal screen scroll.
set sidescroll=5

"" Enable status bar.
set laststatus=2

"" Don't wrap by default.
set nowrap

"" Listing of characters.
set list
set listchars=extends:<,tab:\|\ ,nbsp:•

"" Enable line numbering.
set number

"" Add keywords.
set iskeyword+=- si

"" Display the last ran command.
set showcmd

"" Splits.
set splitright
set splitbelow

"" Disable the backup file.
set nobackup

"" Searching.
set ignorecase
set hlsearch

"" Don't use swap files.
set noswapfile

"" Don't redraw during macros.
set lazyredraw

"" -- Here be wizards and warriors.
set magic

"" Hide abandoned buffers.
set hidden

"" Backspacing.
set backspace=indent,eol,start

" Groups.
"" Decorating the statusline.
augroup __stl
    au!
    " Determine the size of the currently active file.
    function! Filesize()
        let bytes = getfsize(expand("%:p"))
        return bytes <= 1024 ? (bytes <= 0 ? "0B" : bytes . "B") : (bytes / 1024) . "K"
    endfunc

    set ls=2     " Display the stl at all times.
    set stl=     " A clean sheet to append to.
    set stl+=%L: " Number of lines in buffer.
    set stl+=%l: " Line number.
    set stl+=%c  " Column number.
    set stl+=%=  " Separation point between left and right aligned items.
    set stl+=%m  " Modified flag, '[+]'; '[-]' if 'modifiable' is off.
    set stl+=%h  " Help buffer flag, '[help]'; '' if not a help buffer.
    set stl+=[%{Filesize()}]
augroup end

"" Unknown filetypes to vim, some make sense, others don't.
augroup __filtype
    au!
    au BufRead,BufNewFile *.inc,*.phpt  setlocal ft=php
    au BufRead,BufNewFile *.json,*.es6  setlocal ft=javascript
    au BufRead,BufNewFile hosts,*.log   setlocal ft=conf
    au BufRead,BufNewFile http*.conf    setlocal ft=apache
    au BufRead,BufNewFile *.groff       setlocal ft=groff
    au BufRead,BufNewFile *.csst        setlocal ft=css
    au BufRead,BufNewFile *.conf        setlocal ft=nginx
    au BufRead,BufNewFile *.ini         setlocal ft=dosini
    au BufRead,BufNewFile *.txt         setlocal ft=txt
    au BufRead,BufNewFile *.tpl         setlocal ft=smarty
    au BufRead,BufNewFile *.sql         setlocal ft=mysql
    au BufRead,BufNewFile *.md          setlocal ft=markdown
    au BufRead,BufNewFile *.cl          setlocal ft=lisp
    au BufRead,BufNewFile *.ss          setlocal ft=scheme
    au BufRead,BufNewFile *.di          setlocal ft=d
    au BufRead,BufNewFile *.m           setlocal ft=objc
    au BufRead,BufNewFile *.i           setlocal ft=c
    au BufRead,BufNewFile *.h           setlocal ft=c

    " Whenever we need a tabwith of 2.
    au BufRead,BufNewFile *.vim,*.hs,*.l,*.es6,*.scss,*.scm,*.rb,*.html,*.erb,*.js,*.css,*.cl,*.lsp,*.lisp set tabstop=4 softtabstop=0 shiftwidth=2
augroup end

"" Return to last edit position when opening files.
augroup __cursor
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup end

"" Remove the trailing whitespace whenever saving the file.
augroup __save
    au!
    au BufWritePre * :%s/\s\+$//e
augroup end

"" Make help buffers more readable and closeable with `q`.
augroup __buffer
    au!
    autocmd FileType help wincmd L | vert resize 80
    autocmd BufEnter * if &filetype==?'help' | execute 'normal 0' | vert resize 80 | endif

    autocmd FileType * if &buftype!='' | nnoremap <buffer><silent> q <esc>:bd<cr> | endif
augroup end

" Let's.
"" Leader of all.
let mapleader = ' '

" Keybindings.
"" Navigate through splits.
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"" Navigate through buffers.
nnoremap Z :bprev<CR>
nnoremap X :bnext<CR>

"" Interact with buffers.
nnoremap <Leader>w :bwipe<CR>

"" Upload a visual selection to ix.io
vnoremap <Leader>u :'<,'>w !ix<CR>

"" Indent more than once on visual blocks.
vnoremap < <gv
vnoremap > >gv

"" Focus in the center of the screen when finding the next match.
nnoremap N Nzz
nnoremap n nzz

"" Switch : and ; for convenience.
nnoremap : ;
nnoremap ; :
