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

return M
