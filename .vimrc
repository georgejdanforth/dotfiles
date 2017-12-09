" Basic config options
syntax on                          " Enable syntax highlighting
set nocompatible                   " Non-backwards compatible mode
set expandtab                      " On pressing tab, insert 4 spaces
set shiftwidth=4                   " When indenting with '>', use 4 spaces width
set softtabstop=4                  " Show existing tab with 4 spaces width
set backspace=indent,eol,start     " Change backspace to normal
set cursorline                     " Highlight line cursor is on
set colorcolumn=80                 " Color column at col. 80
set number                         " Enable line numbering
set incsearch                      " Automatically start matching search query
set laststatus=2                   " Always show a status line
set autoindent                     " Start newlines with the current indentation level
set smartindent                    " Make indentation smarter
set cindent                        " C-style indentation of for all files

" Map capitol commands for save and quit
cnoremap W w
cnoremap Q q

" Required for Vundle!
filetype off

" Vundle plugin settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Add Plugins below here:

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'delimitMate.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'raimondi/yaifa'
Plugin 'Vimjas/vim-python-pep8-indent'

" Plugins must be added before here:
call vundle#end()

" Ok we can turn this back on now. Filtype checking and autoindenting!
filetype plugin indent on


" Python highlighting
let python_highlight_all=1


" YCM options
let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_server_python_interpreter = '/usr/loca/Cellar/python3/3.5.2/bin/python3'

" airline options
set laststatus=2
"let g:airline_section_b='%{strftime("%c")}'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1

" vim-latex options
let g:Tex_UseMakefile=0
"let g:Tex_CompileRule_pdf="make" 

" ColorScheme
colorscheme gruvbox

" Make background transparent
hi Normal ctermbg=None

" Override highlighted text color settings
highlight Visual term=reverse cterm=NONE ctermbg=LightBlue ctermfg=None guibg=NONE
