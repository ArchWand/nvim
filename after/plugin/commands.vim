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

" Make sure formatoptions don't get overriden by defaults
au BufEnter * set formatoptions=c/qnj

" Enable ftplugin for filetype= (no filetype)
function CallIfEmpty()
    " If no filename, file doesn't exist, or file is empty
    if @% == "" || filereadable(@%) == 0 || (line('$') == 1 && col('$') == 1)
        set ft=noft
    endif
endfunction

au VimEnter * call CallIfEmpty()
