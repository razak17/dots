local M = {}

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

return M
