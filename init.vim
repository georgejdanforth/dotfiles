" Basic config options
set cursorline                                   " Highlight the current line.
set expandtab                                    " On pressing tab, insert 4 spaces.
set shiftwidth=4                                 " When indenting with '>', use 4 spaces.
set softtabstop=4                                " Show existing tab with 4 spaces width.
set colorcolumn=80                               " Color colum and column 80.
set number                                       " Enable line numbering.
set autoindent                                   " Start newlines with the current indentation level.
set smartindent                                  " Make indentation smarter.
set cindent                                      " C-style indentation for all files.
set background=dark                              " Set background to dark. Gruvbox looks best this way.
set guicursor=                                   " Disable changing cursor shape in insert mode.
set scrolloff=10                                 " Start scrolling 10 lines from the top/bottom.


""" Mappings
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

""" vim-plug plugin settings
call plug#begin('~/.config/nvim/plugged')
" Add plugins below here.

    Plug 'flazz/vim-colorschemes'                " Massive colorscheme bundle.
    Plug 'vim-airline/vim-airline'               " Helpful status bar plugin.
    Plug 'vim-airline/vim-airline-themes'        " Colorscheme bundle for airline.
    Plug 'raimondi/delimitmate'                  " Autocompletion for delimiters.
    Plug 'roxma/nvim-completion-manager'         " Autocompletion for all sorts of things.
    Plug '/usr/local/opt/fzf'                    " Locally installed fzf
    Plug 'junegunn/fzf.vim'                      " Vim bindings for fzf
    Plug 'georgejdanforth/vim-clip'

" Plugins must be added before here.
call plug#end()

""" Plugin functionality
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""" Look and feel
colorscheme gruvbox                              " Set gruvbox as main colorscheme.

set laststatus=2                                 " Always show status bar.
let g:airline_theme='gruvbox'                    " Set the airline theme to gruvbox
let g:airline#extensions#tabline#enabled=1       " Use airline for tabs.

""" VimR config
if has('gui_vimr')
    set termguicolors                            " Ensures that airline is rendered by vimr.
endif
