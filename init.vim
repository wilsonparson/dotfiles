" ------------------------------------------
"  General Settings
" ------------------------------------------

filetype plugin indent on

set expandtab       " On pressing tab, insert 2 spaces
set tabstop=2       " Show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2    " When indenting with '>', use 2 spaces width
set number          " Display line numbers
set linebreak       " Don't break words when wrapping

" Map space to leader key
map <SPACE> \


" ------------------------------------------
" Plugins
" ------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Make shortcut similar to VS Code Cmd+p
nnoremap <silent> <leader>p :Files<CR>
Plug 'junegunn/fzf.vim'

" NERDTree
Plug 'preservim/nerdtree'
" Use similar toggle key to VS Code
map <leader>b :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1    " Show hidden files

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd FileType markdown let b:coc_suggest_disable = 1   " Disable auto-complete for markdown

" Syntax Highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Prettier
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

let g:prettier#autoformat = 1   " Format on Save
let g:prettier#autoformat_require_pragma = 0

" Comments
Plug 'tomtom/tcomment_vim'

" Text search
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --column'  " Use ag (silver searcher) instead of Ack
let g:ackhighlight = 1  " Highlight the searched term
map <leader>f :Ack 

call plug#end()
