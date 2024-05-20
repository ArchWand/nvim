" User Commands

" Reload vimrc
command R source $MYVIMRC

" Vertical split terminal
command Vterm vsp|term

" Autocommands

" Highlight when yanking text
"  See `:help vim.highlight.on_yank()`
au TextYankPost * silent! lua vim.highlight.on_yank {timeout=150}

" Configure termianl buffers
au TermOpen * setlocal nonumber norelativenumber scrolloff=0

