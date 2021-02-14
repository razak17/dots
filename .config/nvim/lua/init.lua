require 'setup'
require 'opts'
require 'conf'
require 'binds'
require 'plugins'

if vim.fn.exists('g:vscode') ~= 1 then
  require 'autocmd'
  require 'aesth.bg'
  require 'utils.plug_cmd'
  require 'plugin.nvim-tree'
  require 'plugin.colorizer'
end
