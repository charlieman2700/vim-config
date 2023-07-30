"
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

set nocompatible

call plug#begin()


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-svelte-kit',
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/tailwindcss')
  let g:coc_global_extensions += ['@yaegassy/coc-tailwindcss3']
endif


if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Funcionality
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax 
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'peitalin/vim-jsx-typescript'

" Colorschemes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'ericbn/vim-solarized'
Plug 'adonaldson/vim-tictoc'

call plug#end()

" Options
set number
set termguicolors

set hidden
let g:airline#extensions#tabline#enabled = 1

syntax enable
set background=dark
colorscheme spaceduck



" COC
runtime coc.vim

" UNDO
runtime undoStore.vim



" Move between windows using CTRL + h/l/j/k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Mappings
let mapleader = " "
" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" LSP
nnoremap <leader>lf :Format<CR>
nmap <leader>lk <Plug>(coc-diagnostic-prev)
nmap <leader>lj  <Plug>(coc-diagnostic-next)

" Buffers
nnoremap <S-L> :bnext<CR>
nnoremap <S-H> :bprev<CR>
nnoremap <leader>x :bdelete<CR>
