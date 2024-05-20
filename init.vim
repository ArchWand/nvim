let mapleader=' '
let maplocalleader='\'
let g:have_nerd_font=v:true

lua << EOF
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)
require('lazy').setup( { import = 'plugins' }, {
  change_detection = { notify = false },
})
EOF

" Further configuration in:
" $XDG_CONFIG_HOME/nvim/after/plugin
" $XDG_CONFIG_HOME/nvim/after/ftplugin
" $XDG_CONFIG_HOME/nvim/lua/plugins
