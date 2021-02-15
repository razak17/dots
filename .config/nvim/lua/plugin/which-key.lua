local vim, g = vim, vim.g
local api = vim.api
local fn = vim.fn

g.which_key_sep = ''
g.which_key_timeout = 100
g.which_key_use_floating_win = 0
g.which_key_display_names = {
  ['<CR>']  = '↵',
  ['<TAB>'] =  '⇆'
}

api.nvim_set_keymap('n', "<leader>", ":<c-u> :WhichKey '<space>'<cr>",  {noremap = true, silent = true})
api.nvim_set_keymap('v', "<leader>", ":<c-u> :WhichKeyVisual '<space>'<cr>",  {noremap = true, silent = true})
fn['which_key#register']('<space>', 'g:which_key_map')

g.which_key_map = {
  ["="] = "Balance window",
  ["-"] = "Decrease split by 5",
  ["+"] = "Increase split by 5",
  ["."] = "Open init.vim",
  [","] = "Open init.lua",
  ["/"] = "Comment",
  ["<CR>"] = "Source init.vim",
  d = "Delete current buffer",
  x = "Quit",
  y = "Yank",
  a = {
    name = "+Actions",
    ["/"] = "comment motion default",
    d = "delete all buffers and exit",
    D = "delete all",
    F = "resize 90%",
    h = "horizontal split",
    n = "no highlight",
    N = "toggle line numbers",
    R = "toggle relative line numbers",
    s = "save and exit",
    T = "terminal",
    u = "undotreeToggle",
    v = "vertical split",
    V = "select all",
    x = "exit",
    Y = "yank all",
    z = "force exit",
  },
  b = {
    name = "+Find",
    s = "word"
  },
  c = {
    name = "+Command",
    h = {
      name = "+Help",
      w = "word"
    },
    f = "nvim-tree find",
    r = "nvim-tree refresh",
    s = "edit snippet",
    v = "nvim-tree toggle",
  },
  f = {
    name = "+Telescope",
    c = {
      name = "+Command",
      A = "autocmds",
      c = "commands",
      b = "buffers",
      f = "builtin",
      h = "help",
      H = "history",
      k = "keymaps",
      o = "old files",
      r = "registers",
      T = "treesitter",
      v = "vim options",
      z = "current file fuzzy find",
    },
    l = {
      name = "+Live",
      g = "grep",
      w = "current word",
      e = "prompt",
    },
    v = {
      name = "+Lsp",
      a = "code action",
      r = "references",
      s = {
        name = "+Symbols",
        d = "document",
        w = "workspace",
      }
    },
    y = "format",
    g = {
      name = '+Git',
      b = "branches",
      c = "commits",
      C = "bcommits",
      f = "files",
      s = "status",
    }
  },
  F = {
    name = "+Far",
    f = "replace in File",
    r = "replace in Project"
  },
  g = {
    name = "+Git",
    a = 'fetch all',
    b = 'branches',
    A = 'blame',
    c = 'commit',
    d = 'diff',
    D = 'diff split',
    h = 'diffget',
    k = 'diffget',
    l = 'log',
    p = 'push',
    P = 'pull',
    r = 'remove',
    s = 'status',
  },
  I = {
      name = "+Info",
      c = "check health",
      L = "Lsp"
  },
  l = {
    name = "+Delete buffer",
    d = "all",
    h = "to left",
    x = "all except current",
  },
  C = {
    name = "+Switch case",
    c =  'shake_case -> camelCase',
    P =  'snake_case -> PascalCase',
    s =  'camelCase/PascalCase -> snake_case',
  },
  P = {
    name = "+Plug",
    c =  'compile',
    C =  'clean',
    i =  'install',
    s =  'sync',
    U =  'update',
  },
  -- r = { name = "+Visual"},
  s = {
    name = "+Tab",
    b = 'previous',
    d = 'close',
    H = 'move left',
    k = 'delete Session',
    K = 'last',
    l = 'next',
    L = 'move right',
    N = 'new',
  },
  S = {
    name = "+Session",
    c = 'close Session',
    d = 'delete Session',
    l = 'load Session',
    s = 'save Session',
  },
  T = {
    name = "+Floaterm",
    e =  'toggle',
    n =  'node',
    N =  'new terminal',
    p =  'python',
    r =  'ranger',
  },
  v = {
    name = "+Code",
    a = "code action",
    D = "preview definition",
    d = {
      name = "+Diagnostics",
      b = "goto previous",
      c = "current line",
      l = "set loc list",
      n = "goto next",
    },
    f = "find the cursor word definition and reference",
    l = {
      name = "+Lsp",
      f = {
        name = "+find",
        w = "workspace symbols"
      },
      h = "show hover doc",
      i = "implementation",
      p = "peek Definition",
      r = "references",
      R = "rename",
      S = "signature",
      s = {
          name = "+Symbols",
          d = "document symbols",
          -- w = "workspace symbols"
      },
      t = "type definition",
    },
    w = {
      name = "+Color",
      m = "pencils"
    },
  },
}

-- TODO  (get this to work)
function WhichKeyReverse()
  local key_maps = g.which_key_map
  key_maps.r.e = 'line'
  key_maps.r.e.v = 'reverse'
  g.which_key_map = key_maps
end

_G.WhichKey = {}

-- TODO  (get this to work)
WhichKey.SetKeyOnFT=function()
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    WhichKeyReverse()
  end
end
