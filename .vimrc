"Enable syntax highlighting
syntax enable

"Non-backwards compatible mode
set nocompatible
filetype off

" Map capitol commands for save and quit
cnoremap W w
cnoremap Q q

" Vundle plugin settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle***REMOVED***begin()

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

" Plugins must be added before here:
call vundle***REMOVED***end()

"Auto indent
filetype plugin indent on

" Python highlighting
let python_highlight_all=1

" show existing tab with 4 spaces width
set tabstop=4

" when indentin with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

"Highlight line cursor is on
set cursorline

"Color column at col. 80
set colorcolumn=80

"Change backspace to normal
set backspace=indent,eol,start

"Enable line numbering
set number

" YCM options
let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_server_python_interpreter = '/usr/loca/Cellar/python3/3.5.2/bin/python3'

" airline options
set laststatus=2
"let g:airline_section_b='%{strftime("%c")***REMOVED***'
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:airline***REMOVED***extensions***REMOVED***tabline***REMOVED***enabled=1

" vim-latex options
let g:Tex_UseMakefile=0
"let g:Tex_CompileRule_pdf="make" 

" ColorScheme
"
" Solarized options
"set background=none
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1

"colorscheme pride
colorscheme gruvbox

" Make background transparent
hi Normal ctermbg=None

" Override highlighted text color settings
highlight Visual term=reverse cterm=NONE ctermbg=LightBlue ctermfg=None guibg=NONE
