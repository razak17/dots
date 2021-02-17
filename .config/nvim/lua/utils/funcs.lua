local M = {}
local api =  vim.api
local G = require 'global'
local HOME = G.home

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function M.makeScratch()
  api.nvim_command('enew') -- equivalent to :enew
  vim.bo[0].buftype='nofile' -- set the current buffer's (buffer 0) buftype to nofile
  vim.bo[0].bufhidden='hide'
  vim.bo[0].swapfile=false
end

function M.EmptyRegisters()
  local regs=vim.fn.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for _, r in ipairs(regs) do
    vim.fn.call(vim.fn.setreg(r, {}))
  end
end

function M.OpenTerminal()
  api.nvim_command("split term://zsh")
  api.nvim_command("resize 10")
end

function M.search_dotfiles()
  require('telescope.builtin').find_files {
    find_command = {'git', '--git-dir=', HOME .. '/dots/', '--work-tree', HOME, 'ls-tree', '--full-tree', '-r', '--name-only', 'HEAD'}
  }
end

function M.ColorMyPencils()
  vim.o['background']='dark'
  -- vim.cmd('highlight ColorColumn ctermbg=0 guibg=cyan')
  vim.cmd('highlight Normal guibg=none')
  vim.cmd('highlight LineNr guifg=#4dd2dc')
  vim.cmd('highlight netrwDir guifg=#aeacec')
  vim.cmd('highlight qfFileName guifg=#aed75f')
  vim.cmd('hi TelescopeBorder guifg=#4dd2dc')
  vim.cmd('hi FloatermBorder guifg=#4dd2dc')
end

function M.TurnOnGuides()
  vim.cmd('set rnu')
  vim.cmd('set nu ')
  vim.cmd('set signcolumn=yes')
  vim.cmd('set colorcolumn=80')
end

function M.TurnOffGuides()
  vim.cmd('set nornu')
  vim.cmd('set nonu')
  vim.cmd('set signcolumn=no')
  vim.cmd('set colorcolumn=800')
end

function M.RunPython()
  api.nvim_command('exec "! python %"')
end

function M.RunTS()
  api.nvim_command('exec "! ts-node %"')
end

function M.RunJS()
  api.nvim_command('exec "! node %"')
end

return M
