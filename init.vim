" Basic config options
set cursorline                                   " Highlight the current line.
set expandtab                                    " On pressing tab, insert 4 spaces.
set shiftwidth=4                                 " When indenting with '>', use 4 spaces.
set softtabstop=4                                " Show existing tab with 4 spaces width.
set colorcolumn=80                               " Color colum and column 80.
set number relativenumber                        " Enable line numbering.
set autoindent                                   " Start newlines with the current indentation level.
set smartindent                                  " Make indentation smarter.
set cindent                                      " C-style indentation for all files.
set background=dark                              " Set background to dark. Gruvbox looks best this way.
set scrolloff=8                                  " Start scrolling 8 lines from the top/bottom.
set termguicolors

set guicursor=
    \n-v-c-r-cr:block
    \,i-ci:ver25
    \,a:blinkwait0-blinkoff400-blinkon250


""" Mappings
let mapleader=" "

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

noremap Y "+y

nnoremap <Leader>q :clo<CR>
nnoremap <Leader>r :e!<CR>
nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>fg :Telescope git_files<CR>
nnoremap <Leader>fb :Telescope buffers<CR>
nnoremap <Leader>rg :Telescope live_grep<CR>


""" vim-plug plugin settings
call plug#begin('~/.config/nvim/plugged')
" Add plugins below here.

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'neovim/nvim-lspconfig'

    Plug 'rktjmp/lush.nvim'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'ojroques/nvim-hardline'

    Plug 'raimondi/delimitmate'
    Plug 'hrsh7th/nvim-compe'

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'

    " telescope stuff
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'psf/black', { 'branch': 'stable' }

" Plugins must be added before here.
call plug#end()

""" Plugin functionality
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let NERDTreeShowHidden=1

lua <<EOF
require('lspconfig').pyls.setup{}

require('nvim-treesitter.configs').setup{
    ensure_installed = "maintained",
    ignore_install = {},
    highlight = {
        enable = true,
        custom_captures = {
            ['method'] = 'GruvboxAqua',
            ['function'] = 'GruvboxAqua',
            ['field'] = 'GruvboxWhite',
            ['parameter'] = 'GruvboxWhite',
            ['constant.builtin'] = 'GruvboxPurple',
            ['type.builtin'] = 'GruvboxPurple',
            ['keyword.operator'] = 'GruvboxRed',
        },
    },
    indent = {
        enable = false,
    },
}

require('hardline').setup{
    theme = 'gruvbox',
}

require('compe').setup{
    enabled = true,
    autocomplete = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        spell = true,
        tags = true,
        nvim_lsp = true,
        nvim_lue = false,
        omni = false,
    }
}
EOF

""" Look and feel
colorscheme gruvbox                              " Set gruvbox as main colorscheme.
set laststatus=2                                 " Always show status bar.

""" Filetype-specific
autocmd FileType go setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
