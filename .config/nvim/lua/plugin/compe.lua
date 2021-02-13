local mappings = require 'utils.map'
local inoremap = mappings.inoremap
local opts = { expr = true }

require('compe').setup {
  enabled = true;
  debug = false;
  min_length = 2;
  preselect = "enable";
  source_timeout = 200;
  incomplete_delay = 400;
  allow_prefix_unmatch = false;
  source = {
    nvim_lsp = true;
    buffer = true,
    calc = true,
    vsnip = true;
    path = true;
  };
}

inoremap("<C-Space>", "compe#complete()", opts)
inoremap("<CR> ",     "compe#confirm('<CR>')", opts)
inoremap("<C-e>",     "compe#close('<C-e>')", opts)
inoremap("<C-f>",     "compe#scroll({ 'delta': +4 })", opts)
inoremap("<C-d>",     "compe#scroll({ 'delta': -4 })", opts)
