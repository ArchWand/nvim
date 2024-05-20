return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
  },
  opts = {
    -- disable_filetype = { "TelescopePrompt", "spectre_panel" },
    -- disable_in_macro = true, -- disable when recording or executing a macro
    -- disable_in_visualblock = false, -- disable when insert after visual block mode
    -- disable_in_replace_mode = true,
    ignored_next_char = [=[[%S]]=],
    -- enable_moveright = true,
    -- enable_afterquote = true, -- add bracket pairs after quote
    enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
    -- enable_bracket_in_quote = true, --
    -- enable_abbr = false, -- trigger abbreviation
    -- break_undo = true, -- switch for basic rule break undo sequence
    -- check_ts = false,
    -- map_cr = true,
    -- map_bs = true,  -- map the <BS> key
    -- map_c_h = false,  -- Map the <C-h> key to delete a pair
    -- map_c_w = false, -- map <c-w> to delete a pair if possible
    fast_wrap = {
      -- map = '<M-e>',
      -- chars = { '{', '[', '(', '"', "'" },
      -- pattern = [=[[%'%"%>%]%)%}%,]]=],
      -- end_key = '$',
      -- before_key = 'h',
      -- after_key = 'l',
      -- cursor_pos_before = true,
      -- keys = 'qwertyuiopzxcvbnmasdfghjkl',
      -- manual_position = true,
      -- highlight = 'Search',
      -- highlight_grey='Comment'
    },
  },
  config = function(_, opts)
    require('nvim-autopairs').setup(opts)

    local npairs   = require 'nvim-autopairs'
    local Rule     = require 'nvim-autopairs.rule'
    local cond     = require 'nvim-autopairs.conds'
    -- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    -- local cmp           = require 'cmp'
    --
    -- -- If you want to automatically add `(` after selecting a function or method
    -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
    npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
    npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

    local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
    npairs.add_rules {
      -- Rule for a pair with left-side ' ' and right side ' '
      Rule(' ', ' ')
        -- Pair will only occur if the conditional function returns true
        :with_pair(function(opts)
          -- We are checking if we are inserting a space in (), [], or {}
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2]
          }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
        :with_del(function(opts)
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local context = opts.line:sub(col - 1, col + 2)
          return vim.tbl_contains({
            brackets[1][1] .. '  ' .. brackets[1][2],
            brackets[2][1] .. '  ' .. brackets[2][2],
            brackets[3][1] .. '  ' .. brackets[3][2]
          }, context)
        end)
    }

    -- For each pair of brackets we will add another rule
    for _, bracket in pairs(brackets) do
      npairs.add_rules {
        -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
        Rule(bracket[1] .. ' ', ' ' .. bracket[2])
          :with_pair(cond.none())
          :with_move(function(opts) return opts.char == bracket[2] end)
          :with_del(cond.none())
          :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
          :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
      }
    end
  end
}
