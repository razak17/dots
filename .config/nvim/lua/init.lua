if vim.fn.exists('g:vscode') ~= 1 then
  require 'setup'
  require 'conf'
end

require 'opts'
require 'binds'
require 'plugins'

if vim.fn.exists('g:vscode') ~= 1 then
  require 'autocmd'
  require 'aesth.bg'
  require 'aesth.hijackc'
  require 'utils.plug_cmd'
  require 'plugin.nvim-tree'
  require 'plugin.colorizer'
end
