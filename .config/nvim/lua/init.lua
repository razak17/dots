require 'setup'
require 'conf'
require 'opts'
require 'plugins'

if vim.fn.exists('vim.g.vscode') ~= nil then
  require 'binds'
  require 'autocmd'
  require 'aesth.bg'
  require 'utils.plug_cmd'
  require 'plugin.nvim-tree'
  require 'plugin.colorizer'
end
