" Install Vundle Plugin Manager with
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Use with :PluginInstall

" Install mono, go, jdk10-openjdk, cmake, clang
" Install nvm from aur
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer --system-libclang --all
" python3 install.py --clang-completer
" Also see https://salsa.debian.org/debian/vim-youcompleteme#java-semantic-completion

" Install astyle to make use of (C-lang. formatter)

set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" ##########################################
" Vundle Plugins and Bundles (Section Start)

" Theme
Plugin 'kristijanhusak/vim-hybrid-material'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Nerd Tree
Plugin 'scrooloose/nerdtree'
" Python Autoformat
Plugin 'vim-scripts/indentpython.vim'
" Ale Linting
Plugin 'w0rp/ale'
" Search with ctrl + p
Plugin 'kien/ctrlp.vim'
" Git integration for nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Completition Magic
Plugin 'Valloric/YouCompleteMe'
" Multicursor
Plugin 'terryma/vim-multiple-cursors'
" Git Gutter
Plugin 'airblade/vim-gitgutter'
" Toggle comments (leader c)
Plugin 'chemzqm/mycomment.vim'
" File buffer in tabline
Plugin 'ap/vim-buftabline'
" Html, Css, Js completion
Plugin 'mattn/emmet-vim'

" Vundle Plugins and Bundles (Section End)
" #########################################
call vundle#end()            " required
filetype plugin indent on    " required

" #################
" General Settings
" #################

" Theming (highlight, set numbers)
syntax on
set background=dark
colorscheme hybrid_reverse
set nu
set encoding=utf-8
:let mapleader = ","
" Enable backspace
set backspace=indent,eol,start

" Buffer mappings
set hidden
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprev<CR>

" Add powerline
set  rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Nerd tree (open if dir)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
map <C-N> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" Search TODO
com FindTodo :vimgrep /\<TODO\>/j **/* | :cope

" Tab navigation
nnoremap <leader>l :tabprevious<CR>
nnoremap <leader>h :tabnext<CR>

" YCM go to definiton
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.global_ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0

" Multicursor plugin bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-g>'
let g:multi_cursor_next_key            = '<C-g>'
let g:multi_cursor_quit_key            = '<Esc>'

" Ale linter
au BufNewFile,BufRead *.py
    \ nmap <F8> <Plug>(ale_fix)
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
    \     'python': ['flake8'],
    \ }
let b:ale_fixers = {
    \     'python': ['autopep8', 'isort'],
    \     'java': ['google_java_format'],
    \ }

" astyle linter
au BufNewFile,BufRead *.cpp
    \ nnoremap <F8> :%!astyle --mode=c --style=allman -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=c --style=allman -s4<CR>
au BufNewFile,BufRead *.java
    \ nnoremap <F8> :%!astyle --mode=java --style=java -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=java --style=java -s4<CR>
au BufNewFile,BufRead *.cs
    \ nnoremap <F8> :%!astyle --mode=cs --style=allman -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=cs --style=allman -s4<CR>

" ################
" Python Settings
" ################

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Remove white space
autocmd BufWritePre *.py :%s/\s\+$//e
" Python highlight
let python_highlight_all=1

" #################
" Other Languages
" #################

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Buildout support
" (https://github.com/FBruynbroeck/vim-buildout/blob/master/after/ftplugin/python.vim)
py3 << EOF
import os
import sys
def appendSysPathByPath(path):
    if not path in sys.path:
        sys.path.append(path)
currentpath = os.getcwd().split('/')
for i in range(len(currentpath), -1, -1):
    position = len(currentpath) - i
    if position:
        currentpath = currentpath[0:-position]
    path = "/".join(currentpath)
    if os.path.isdir(os.path.join(path, 'plone3')):
        path = os.path.join(path, 'plone3')
    elif os.path.isdir(os.path.join(path, 'plone4')):
        path = os.path.join(path, 'plone4')
    path = os.path.join(path, 'parts', 'omelette')
    if os.path.isdir(path):
        appendSysPathByPath(path)
        break
EOF
