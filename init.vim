" ------------------------------------------
"  General Settings
" ------------------------------------------

filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab

" Show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" When indenting with '>', use 2 spaces width
set shiftwidth=2

" Display line numbers
:set number
"
" Don't break words when wrapping
:set linebreak

" ------------------------------------------
" Map Space to leader key
" ------------------------------------------
:map <SPACE> \

" ------------------------------------------
" Plugins
" ------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Make shortcut similar to VS Code Cmd+p
nnoremap <silent> <leader>p :Files<CR>

Plug 'junegunn/fzf.vim'

" ---

" NERDTree
Plug 'preservim/nerdtree'

" Use similar toggle key to VS Code
map <leader>b :NERDTreeToggle<CR>

" Show hidden files
let g:NERDTreeShowHidden=1

" ---
  
" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Disable auto-complete for markdown
autocmd FileType markdown let b:coc_suggest_disable = 1

" ---

" Syntax Highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" ---

" Prettier

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Format on Save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" ---

" Comments
Plug 'tomtom/tcomment_vim'

call plug#end()
