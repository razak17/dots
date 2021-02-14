require 'setup'
require 'conf'
require 'opts'
require 'plugins'
require 'binds'

if vim.fn.has('nvim') ~= 0 then
  require 'autocmd'
  require 'aesth.bg'
  require 'utils.plug_cmd'
  require 'plugin.nvim-tree'
  require 'plugin.colorizer'
end
