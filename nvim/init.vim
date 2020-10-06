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
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak
set cmdheight=2
set updatetime=50
set colorcolumn=80
set cursorline
set formatoptions-=cro
set foldmethod=syntax
set foldcolumn=0
set foldlevel=99
let javaScript_fold=1

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-dirvish'

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
let g:netrw_fastbrowse = 0  " Close buffer after choosing file

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#po#enabled = 0

autocmd FileType markdown let b:coc_suggest_disable = 1

" ------------------------------------------
" Mappings
" ------------------------------------------

let mapleader = ' '
nnoremap <leader><CR> :source $MYVIMRC<CR>
nnoremap <leader>r :edit $MYVIMRC<CR>
nmap <leader>e :CocCommand explorer<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>P :Files<CR>
nnoremap <leader>f :Ag 
nmap <leader>gs :Gstatus<CR> :resize 20<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-N>"

" ------------------------------------------
" Coc Mappings
" ------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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



