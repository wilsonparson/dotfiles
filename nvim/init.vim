" ------------------------------------------
"  General Settings
" ------------------------------------------

syntax enable
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set number
set wildmenu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nohlsearch
set showcmd
set termguicolors
set scrolloff=8
set completeopt=menuone
set nowrap
set splitright
set splitbelow
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak
set cmdheight=2
set updatetime=50
set colorcolumn=80
set cursorline
set formatoptions-=ro


" ------------------------------------------
" Plugins
" ------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ------------------------------------------
" Colors
" ------------------------------------------

set background=dark
colorscheme gruvbox

" ------------------------------------------
" Plugin Settings
" ------------------------------------------

let g:netrw_liststyle = 3

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

autocmd FileType markdown let b:coc_suggest_disable = 1

" ------------------------------------------
" Mappings
" ------------------------------------------

let mapleader = ' '
nnoremap <leader><CR> :source $MYVIMRC<CR>
nnoremap <leader>e :edit $MYVIMRC<CR>
nnoremap <silent> <leader>p :GFiles<CR>
nnoremap <silent> <leader>P :Files<CR>
nnoremap <silent> <leader>f :Ag
nnoremap <leader>g :Git 
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

