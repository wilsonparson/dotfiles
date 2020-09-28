" ------------------------------------------
"  General Settings
" ------------------------------------------

syntax enable
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set number
set relativenumber
set wildmenu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nohlsearch
set termguicolors
set scrolloff=8
set completeopt=menuone
set nowrap
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak
set cmdheight=2
set updatetime=50
set colorcolumn=80
set cursorline
" Map space to leader key
map <SPACE> \


" ------------------------------------------
" Plugins
" ------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd FileType markdown let b:coc_suggest_disable = 1

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

let g:prettier#autoformat = 1   " Format on Save
let g:prettier#autoformat_require_pragma = 0

" Comments
Plug 'tpope/vim-commentary'

Plug 'overcache/NeoSolarized'
call plug#end()

nnoremap <leader>p :GFiles<CR>
nnoremap <leader>P :Files<CR>

set background=light
colorscheme NeoSolarized
" hi CursorLine term=bold cterm=bold guibg=lightgrey

let g:netrw_liststyle=3
