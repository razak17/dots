local load_plugin_config = require 'utils.funcs'.load_plugin_config

if vim.fn.exists('g:vscode') == 0 then
  require 'setup'
  require 'conf'
end

require 'opts'
require 'binds'
require 'plugins'

if vim.fn.exists('g:vscode') == 0 then
  require 'autocmd'
  require 'aesth.bg'
  require 'aesth.hijackc'
  require 'aesth.statusline'
  require 'utils.plug_cmd'
  -- require 'plugin.ts'.setup()

  -- Plugins
  load_plugin_config('ts')
  load_plugin_config('autopairs')
  load_plugin_config('bufferline')
  load_plugin_config('colorizer')
  load_plugin_config('compe')
  load_plugin_config('cool')
  load_plugin_config('emmet')
  load_plugin_config('far')
  load_plugin_config('floaterm')
  load_plugin_config('illuminate')
  load_plugin_config('lsp')
  load_plugin_config('rooter')
  load_plugin_config('tagalong')
  load_plugin_config('telescope')
  load_plugin_config('tree')
  load_plugin_config('vsnip')
  load_plugin_config('which-key')
end
