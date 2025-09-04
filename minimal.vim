set mouse=a
" set clipboard=unnamedplus
set number relativenumber
set splitright splitbelow

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
onoremap H 0
onoremap L $
noremap y "+y
nmap Y "+Y

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

nnoremap <A-h> <<
nnoremap <A-l> >>
vnoremap <A-h> <gv
vnoremap <A-l> >gv
inoremap <A-h> <C-d>
inoremap <A-l> <C-t>

nnoremap M <Nop>
nnoremap MH H
nnoremap MM M
nnoremap ML L
vnoremap < <gv
vnoremap > >gv

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

