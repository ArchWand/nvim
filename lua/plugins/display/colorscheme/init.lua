local M = require 'plugins.display.colorscheme.catppuccin'

M.init = function()
  vim.cmd.colorscheme 'catppuccin-mocha'
end

return M

