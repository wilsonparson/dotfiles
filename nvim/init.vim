" ------------------------------------------
"  General Settings
" ------------------------------------------

syntax enable
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set number
set wildmode=list,full
set smartcase
set noswapfile
set hidden
set nobackup
set undodir=~/.vim/undodir
set undofile
set nohlsearch
set showcmd
set mouse=a
set termguicolors
set scrolloff=8
set completeopt=menuone
set nowrap
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak
set cmdheight=2
set updatetime=50
set colorcolumn=80
set lazyredraw
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o

" ------------------------------------------
" Plugins
" ------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'mhinz/vim-signify'

" TODO: Setup coc.nvim mappings
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TODO: Install the following:
" Nerdtree
" Auto pairs
" Goyo vim?
" vim-startify
" indentLines
" airline/lightline (if I can figure out how to remove all the cruft on the
" right side of the line)

call plug#end()

" ------------------------------------------
" Colors
" ------------------------------------------

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
" 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
colorscheme material

function! s:toggle_light_mode() 
  if (g:material_theme_style == 'palenight')
    let g:material_theme_style = 'lighter'
  else
    let g:material_theme_style = 'palenight'
  endif
    colorscheme material
endfunction

" ------------------------------------------
" Plugin Settings
" ------------------------------------------

" ------------------------------------------
" Mappings
" ------------------------------------------

let mapleader = ' '
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>c :wincmd c<CR>
nnoremap <leader><CR> :source $MYVIMRC<CR>
nnoremap <leader>r :edit $MYVIMRC<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>P :Files<CR>
nnoremap <leader>f :Ag 
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>L :Lines
nmap <leader>gs :Gstatus<CR>
nmap <leader>gr :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>
nmap <leader>gu :SignifyHunkUndo<CR>
nmap <leader>gd :SignifyHunkDiff<CR>
nnoremap <leader>T :call <SID>toggle_light_mode()<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-N>"
