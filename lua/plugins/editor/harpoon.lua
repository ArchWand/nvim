return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    local map = vim.keymap.set
    map('n', '<leader>ha', function() harpoon:list():add() end)
    map('n', '<leader>h<CR>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- Toggle previous & next buffers stored within Harpoon list
    map('n', '<leader>hn', function() harpoon:list():prev() end)
    map('n', '<leader>hp', function() harpoon:list():next() end)

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    map('n', '<leader>fh', function() toggle_telescope(harpoon:list()) end,
      { desc = 'Open harpoon picker' })
  end,
}
