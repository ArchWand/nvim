return {

  require 'plugins.display.colorscheme',
  require 'plugins.display.dressing',
  require 'plugins.display.lualine',
  require 'plugins.display.indent-blankline', -- Note: check if iter bug fixed
  -- require 'plugins.display.todo-comments',
  require 'plugins.display.which-key',

  require 'plugins.editor.autopairs',
  require 'plugins.editor.bullets',
  require 'plugins.editor.bufresize',
  require 'plugins.editor.comment',
  require 'plugins.editor.harpoon',
  require 'plugins.editor.mini',
  require 'plugins.editor.nvim-window',
  require 'plugins.editor.persistence',
  require 'plugins.editor.smart-splits',
  require 'plugins.editor.telescope',
  require 'plugins.editor.undotree',
  require 'plugins.editor.vim-sleuth',

  require 'plugins.external.gitsigns',
  require 'plugins.external.oil',

  require 'plugins.language.autocompletion',
  require 'plugins.language.conform',
  require 'plugins.language.dap',
  require 'plugins.language.linter',
  require 'plugins.language.lsp',
  require 'plugins.language.treesitter',
  require 'plugins.language.trouble',

}
