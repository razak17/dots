local M = {}
local api =  vim.api

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function EmptyRegisters()
  local regs=vim.fn.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs do
    vim.fn.setreg(r, {})
  end
end

function M.makeScratch()
  api.nvim_command('enew') -- equivalent to :enew
  vim.bo[0].buftype='nofile' -- set the current buffer's (buffer 0) buftype to nofile
  vim.bo[0].bufhidden='hide'
  vim.bo[0].swapfile=false
end

function M.OpenTerminal()
  api.nvim_command("split term://zsh")
  api.nvim_command("resize 10")
end

function M.ColorMyPencils()
  vim.o['background']='dark'
  vim.cmd('highlight Normal guibg=none')
  vim.cmd('highlight LineNr guifg=#5eacd3')
  vim.cmd('highlight netrwDir guifg=#5eacd3')
  vim.cmd('highlight qfFileName guifg=#aed75f')
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
