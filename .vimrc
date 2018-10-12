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


" Flagging unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" You Complete Me options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"might not work with pyenv...?
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py'    )
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

colorscheme zenburn

set nu

" access system clipboard on mac
set clipboard=unnamed

" workarround for You Complete Me
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
