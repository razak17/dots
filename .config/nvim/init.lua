require 'setup'
require 'conf'
require 'opts'
require 'binds'
require 'plugins'

if vim.fn.exists('vim.g.vscode') == 0 then
  require 'autocmd'
  require 'aesth.bg'
  require 'utils.plug_cmd'
  require 'plugin.nvim-tree'
  require 'plugin.colorizer'
end
