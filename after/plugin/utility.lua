-- Utility file must be lua, not vimscript, so LSP can find it

-- [[ Vimscript Functions ]]
vim.cmd([[

" Delete all registers
function WipeRegs()
  let regs = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-*'
  for r in regs
    call setreg(r, [])
  endfor
endfunction

]])

-- [[ Lua Functions ]]

-- "Smart" home
-- Go to the beginning of the line
function GoBoL()
  local pos1 = vim.fn.col '.'
  vim.cmd 'normal! g^'
  local pos2 = vim.fn.col '.'
  if pos1 == pos2 then
    vim.cmd 'normal! ^'
    pos1 = vim.fn.col '.'
    if pos1 == pos2 then
      vim.cmd 'normal! 0'
    end
  end
end

-- "Smart" end
-- Go to the end of the line
function GoEoL()
  local pos = vim.fn.col '.'
  vim.cmd 'normal! g$'
  if vim.fn.col '.' == pos then
    vim.cmd 'normal! $'
  end
  if vim.fn.col('.') == #vim.fn.getline('.') then
    local curpos = vim.fn.getpos('.')
    curpos[5] = vim.v.maxcol -- Set curswant
    vim.fn.setpos('.', curpos)
  end
end

-- Get a single character and insert it in the right spot
function SingleInsert(type)
  vim.cmd.normal(type .. string.rep(vim.fn.nr2char(vim.fn.getchar()), vim.v.count1))
end

-- Toggle the colorcolumn option between off and the parameter.
-- Defaults to textwidth, or if textwidth is not set, 80.
function ToggleColorcolumn(n)
  n = n or ((vim.o.tw == 0) and vim.o.tw or 80)
  local s = ''..n
  vim.opt.colorcolumn = vim.o.cc == s and '0' or s
end

-- Give the actual current and total search statistics for large numbers
function SearchCount()
  local sinfo = vim.fn.searchcount { maxcount = 0 }
  local search_stat = sinfo.incomplete > 0 and '[?/?]'
    or sinfo.total > 0 and ('[%s/%s]'):format(sinfo.current, sinfo.total)
    or nil
  if search_stat then
    return search_stat
  end
  return '[?/?]'
end

-- Print out a table in lua
function Print(t)
  for k, v in pairs(t) do
    print(k, v)
  end
end
