" Basic config options
set cursorline                                   " Highlight the current line.
set expandtab                                    " On pressing tab, insert 4 spaces.
set shiftwidth=4                                 " When indenting with '>', use 4 spaces.
set softtabstop=4                                " Show existing tab with 4 spaces width.
set colorcolumn=88                               " Color colum and column 80.
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
nnoremap <Leader>fb :Telescope file_browser<CR>
nnoremap <Leader>rg :Telescope live_grep<CR>

nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cq :cclose<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>


""" vim-plug plugin settings
call plug#begin('~/.config/nvim/plugged')
" Add plugins below here.

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-path'
    Plug 'L3MON4D3/LuaSnip'

    Plug 'rktjmp/lush.nvim'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'ojroques/nvim-hardline'

    Plug 'raimondi/delimitmate'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'psf/black', { 'branch': 'stable' }

" Plugins must be added before here.
call plug#end()

""" Plugin functionality
" let g:black_linelength=79
" let g:black_skip_string_normalization=1

lua <<EOF

local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys after the language
-- server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --nmap \gd :LspDefinition<cr>
  --nmap \gt :tab split<cr>:LspDefinition<cr>
  --nmap \gs :sp<cr>:LspDefinition<cr>
  --nmap \gv :vsp<cr>:LspDefinition<cr>
  buf_set_keymap('n', 'gdt', '<cmd>tab split<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gdv', '<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gdx', '<cmd>sp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and map buffer
-- local keybindings when the language server attaches
local servers = {
    "pyright",
    -- 'jedi_language_server',
    'rust_analyzer',
    'gopls',
    'tsserver',
    'eslint',
    'tailwindcss',
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 },
    }
end

--[[
nvim_lsp.pylsp.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    settings = {
        plugins = {
            flake8 = { enabled = false, maxLineLength = 88 },
            pycodestyle = { enabled = false },
            pyflakes = { enabled = false },
        },
    },
})
--]]

local cmp = require('cmp')
cmp.setup{
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = '[buf]',
                nvim_lsp = '[lsp]',
                path = '[path]',
            })[entry.source.name]
            return vim_item
        end,
    },
}
cmp.setup.cmdline('/', {
    completion = { autocomplete = false, },
    sources = cmp.config.sources(
        { { name = 'nvim_lsp_document_symbol' }, },
        { { name = 'buffer', keyword_length = 5 }, }
    ),
})
cmp.setup.cmdline(':', {
    completion = { autocomplete = false, },
    sources = cmp.config.sources(
        { { name = 'path' }, },
        { { name = 'cmdline', max_item_count = 20, keyword_length = 5 }, }
    )
})

require('nvim-treesitter.configs').setup{
    ensure_installed = 'maintained',
    ignore_install = {},
    highlight = {
        enable = true,
        disable = { 'yaml' },
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
        enable = true,
        disable = { 'python' }
    },
}

require('hardline').setup{
    theme = 'gruvbox',
}

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"tilt_build_context", "tilt_build_staging"},
    },
}
require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')

EOF

""" Look and feel
colorscheme gruvbox                              " Set gruvbox as main colorscheme.
set laststatus=2                                 " Always show status bar.

""" Filetype-specific
" autocmd FileType h setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
" autocmd FileType c setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascriptreact setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescriptreact setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
