set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" #################
" Add Plugins here:

Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

" ################
" All of your Plugins must be added before this line

call vundle#end()            " required
filetype plugin indent on    " required

" ###############
" Additional Stuff
" ###############

set encoding=utf-8      " mostly use UTF-8 in python

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    
au BufNewFile,BufRead *.js, *.html, *.css, *.vue:
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" You Complete Me options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" workarround for You Complete Me
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

let python_highlight_all=1
syntax on

colorscheme zenburn
set nu

" access system clipboard on mac
set clipboard=unnamed

" nerdtree options
map <C-n> :NERDTreeToggle<CR>

" backspace enable
set backspace=indent,eol,start
