" TODO: Clean up comments & organization

" Map Space to leader key
:map <SPACE> \

" Don't break words when wrapping
:set linebreak

:set number

" PLUGINS
call plug#begin(stdpath('data') . '/plugged')
  " FILE NAVIGATION
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    nnoremap <silent> <leader>p :Files<CR>
    Plug 'junegunn/fzf.vim'
    " Files panel
    Plug 'preservim/nerdtree'
    map <leader>b :NERDTreeToggle<CR>
    " File icons
    Plug 'ryanoasis/vim-devicons'

  " GIT
    " Side-by-side Git diff
    Plug 'tpope/vim-fugitive'
  
  " INTELLISENSE
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Disable auto-complete for markdown
    autocmd FileType markdown let b:coc_suggest_disable = 1

  " SYNTAX HIGHLIGHTING
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " FORMATTING
    " Prettier
      " post install (yarn install | npm install) then load plugin only for editing supported files
      Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
      " Format on Save
      let g:prettier#autoformat = 1
      let g:prettier#autoformat_require_pragma = 0
    " Comments
      Plug 'tomtom/tcomment_vim'

call plug#end()

" TABS
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" Show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
