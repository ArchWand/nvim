set mouse=a
" set clipboard=unnamedplus
set number relativenumber
set ignorecase smartcase incsearch hlsearch
set splitright splitbelow

noremap y "+y
nmap Y "+Y
noremap p "+p
noremap P "+P

noremap H ^
noremap L $

nnoremap MH H
nnoremap MM M
nnoremap ML L

nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>

nnoremap <expr> j v:count ? "j" : "gj"
nnoremap <expr> k v:count ? "k" : "gk"
vnoremap <expr> j v:count ? "j" : "gj"
vnoremap <expr> k v:count ? "k" : "gk"

nnoremap <expr> <A-j> "<Cmd>m +".v:count1."<CR>"
nnoremap <expr> <A-k> "<Cmd>m -".(v:count1+1)."<CR>"
inoremap <expr> <A-j> "<Cmd>m +".v:count1."<CR>"
inoremap <expr> <A-k> "<Cmd>m -".(v:count1+1)."<CR>"
vnoremap <expr> <A-j> ":m '>+".v:count1."<CR>gv"
vnoremap <expr> <A-k> ":m '<-".(v:count1+1)."<CR>gv"

vnoremap < <gv
vnoremap > >gv
nnoremap <A-h> <<
nnoremap <A-l> >>
vmap <A-h> <gv
vmap <A-l> >gv
inoremap <A-h> <C-d>
inoremap <A-l> <C-t>

noremap <C-A-h> <C-w><C-h>
noremap <C-A-j> <C-w><C-j>
noremap <C-A-k> <C-w><C-k>
noremap <C-A-l> <C-w><C-l>
nnoremap <A-i> <C-w>p
inoremap <A-i> <Cmd>wincmd p<CR>

function! SmartReg(key)
  return (v:register == '"' ? '"+' : '') . a:key
endfunction
nnoremap <expr> y SmartReg('y')
xnoremap <expr> y SmartReg('y')
nnoremap <expr> Y SmartReg('y$')
nnoremap <expr> p SmartReg('p')
xnoremap <expr> p SmartReg('p')
nnoremap <expr> P SmartReg('P')
xnoremap <expr> P SmartReg('P')
nnoremap <leader>p <Cmd>let @+=@"<CR>

command R source $MYVIMRC
let mapleader=' '

