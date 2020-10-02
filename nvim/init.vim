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
set formatoptions-=cro

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
let g:netrw_preview = 1
let g:netrw_alto = 0
autocmd FileType netrw setl bufhidden=wipe

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#po#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'short_path'

autocmd FileType markdown let b:coc_suggest_disable = 1

" ------------------------------------------
" Mappings
" ------------------------------------------

let mapleader = ' '
nnoremap <leader><CR> :source $MYVIMRC<CR>
nnoremap <leader>e :edit $MYVIMRC<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>P :Files<CR>
nnoremap <leader>f :Ag 
nnoremap <leader>b :bnext<CR>
nnoremap <leader>B :bprev<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>B <Plug>AirlineSelectPrevTab
nmap <leader>b <Plug>AirlineSelectNextTab
map gd <Plug>(coc-definition)
map gy <Plug>(coc-type-definition)
map gi <Plug>(coc-implementation)
map gr <Plug>(coc-references)
map K :call CocActionAsync('doHover')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

