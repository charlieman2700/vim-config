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

" Funcionality
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'



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
set ignorecase
set smartcase
set hlsearch

set hidden
let g:airline#extensions#tabline#enabled = 1

syntax enable
set background=dark


" Colorschemes
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
nnoremap <Esc> :nohlsearch<CR>

" nnoremap <ESC> :nohl<CR>

"Whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500


" Save and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

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

" FZF
nnoremap <leader>fa :Files<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Colors<CR>
nnoremap <leader>fm :Maps<CR>

" Easymotion
nmap s <Plug>(easymotion-overwin-f2)
