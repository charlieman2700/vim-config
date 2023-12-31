"
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

set nocompatible

call plug#begin()
set mouse=a


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prisma/vim-prisma'

"Snippets

" Funcionality
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'craigemery/vim-autotag'
Plug 'github/copilot.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'christoomey/vim-tmux-navigator'

" Snippets
Plug 'mlaursen/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'



" PHPactor
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}


" Syntax 
Plug 'evanleck/vim-svelte'
Plug 'vieira/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'


"UI
Plug 'Yggdroot/indentLine'

" Colorschemes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'ericbn/vim-solarized'
Plug 'morhetz/gruvbox'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'
Plug 'rafalbromirski/vim-aurora'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }



" Testing
Plug 'tpope/vim-sensible'
Plug 'Shougo/context_filetype.vim'
call plug#end()

" Options
set number
set termguicolors
set ignorecase
set smartcase
set hlsearch
set t_Co=256

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Save on SUDO (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!" show existing tab with 4 spaces width

set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab


set hidden
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeHighlightCursorline = 1

"Airline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

"Color Parenthesis
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,typescript,javascript RainbowParentheses
augroup END

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"





" COC
runtime coc.vim
nmap <space>cc <Plug>(coc-fix-current)
nmap <space>la <Plug>(coc-codeaction)
nmap <space>cw <Plug>(coc-codeaction-cursor)
nmap <space>lA <Plug>(coc-codeaction-source)
nmap <space>cl <Plug>(coc-codeaction-line)

" UNDO
runtime undoStore.vim


" Mappings
let mapleader = " "

" Custom Remaps
nnoremap <Esc> :nohlsearch<CR>
nnoremap ; :
nnoremap <S-U> <C-r>
nnoremap mm %
vnoremap mm %

" Move between windows using CTRL + h/l/j/k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


"Whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=300


" Save and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>E :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>

" LSP
nnoremap <leader>lf :Format<CR>
nnoremap <leader>lR :CocRestart<CR>
nmap <leader>lk <Plug>(coc-diagnostic-prev)
nmap <leader>lj  <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <C-l> coc#refresh()
nmap <leader>lr <Plug>(coc-rename)


" Buffers
nnoremap <S-L> :bnext<CR>
nnoremap <S-H> :bprev<CR>
nnoremap <leader>x :bdelete<CR>

" FZF
nnoremap <leader>fa :Files<CR>
nnoremap <leader>ff :GFiles?<CR>
nnoremap <leader>hh :Buffers<CR>
nnoremap <leader>fc :Colors<CR>
nnoremap <leader>fm :Maps<CR>

"Comment
nmap <leader>/  <Plug>NERDCommenterComment
vmap <leader>/  <Plug>NERDCommenterComment

" Easymotion
nmap s <Plug>(easymotion-overwin-f2)

"Copy to clipboard
vmap <C-c> "+y

" Delimiters
" When i dont want mapping i need to type <C-v> before the key
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

set list lcs=tab:\|\ 
" Colorschemes
syntax enable
set nowrap
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_material_background = 'medium'
colorscheme spaceduck
filetype plugin on





let g:markdown_fenced_languages = ['sql']
