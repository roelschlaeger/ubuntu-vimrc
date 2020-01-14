" vim:ts=2:sw=2:tw=0:wm=0:nowrap:nowrapscan
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copied from $VIMRUNTIME/vimrc_example.vim by rlo 20200113 "
" For use on Ubuntu 19.10 LTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" End of original $VIMRUNTIME/vimrc_example.vim "
"""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup

set nowrap
set nowrapscan

set expandtab

set scrolloff=2

" these are from http://youtube.com/watch?v=XA2WjJbmmmoM
set path+=./**
set wildmenu
command MakeTags !ctags -R .

let g:netrw_banner=0            " disable annoying banner
let g:netrw_browse_split=4      " open in prior window
let g:netrw_altv=1              " open splits to the right
let g:netrw_liststyle=3         " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(|\s\s\)\zs\.\S\+'

" SNIPPETS:
" Create if __name__ == "__main__": for python
nnoremap ,ifn :-1read $HOME/.vim/.skeleton/.python/.ifname.py<CR>2jf)
nnoremap ,py :-1read $HOME/.vim/.skeleton/.python/.python.py<CR>

let mapleader = "/"
nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>e :e $MYVIMRC<CR>
autocmd! BufWritePost .vimrc source %

let mapleader = ","
noremap <C-N> :nohl<CR>
vnoremap <C-N> :nohl<CR>
inoremap <C-N> :nohl<CR>

" bind ctrl-<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving around tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv          " better indentation
vnoremap > >gv          " better indentation

" show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Show line numbers and length
set nonumber            " show relative line numbers
set relativenumber      " show relative line numbers

set tw=80
set fo-=t               " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

set hlsearch
set incsearch
set ignorecase
set smartcase

" echo "∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇∇"
" echo "|.vimrc has been reloaded|"
" echo "∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆"

colorscheme django
