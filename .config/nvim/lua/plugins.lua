local G = require 'global'
local packer = nil
local utils = require 'packer.utils'
local plug_list = require 'packer.list'.load_plugins

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({
      compile_path = G.local_nvim .. 'site' .. G.path_sep .. 'plugin' .. G.path_sep .. 'packges.vim',
      config = {
        display = {
          _open_fn = function(name)
            local ok, float_win = pcall(function()
              return require('plenary.window.float').percentage_range_window(0.8, 0.8)
            end)

            if not ok then
              vim.cmd [[65vnew  [packer] ]]
              return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
            end

            local bufnr = float_win.buf
            local win = float_win.win

            vim.api.nvim_buf_set_name(bufnr, name)
            vim.api.nvim_win_set_option(win, 'winblend', 10)

            return win, bufnr
          end
        }
      }
    })
  end
  local use = packer.use
  packer.reset()

  use {'wbthomason/packer.nvim', opt = true}
  use 'tpope/vim-surround'

  if vim.fn.exists('g:vscode') ~= 1 then
    for  _, item in ipairs(plug_list()) do
      utils.load_plugin(use, item)
    end
  end
end

local plugins =
  setmetatable(
  {},
  {
    __index = function(_, key)
      init()
      return packer[key]
    end
  }
)

return plugins
