local vim = vim
local api = vim.api

local function augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command("augroup " .. group_name)
    api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      api.nvim_command(command)
    end
    api.nvim_command("augroup END")
  end
end

local bufs = {
  -- Reload vim config automatically
  {"BufWritePost", [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]},
  -- Reload Vim script automatically if setlocal autoread
  {
    "BufWritePost,FileWritePost",
    "*.vim",
    [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]
  },
  -- Disable swap/undo/viminfo/shada files in temp directories or shm
  {
    "BufNewFile,BufReadPre",
    "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    "setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada="
  },
  {
    "BufWritePost",
    "bash,c,cs,slojure,cpp,css,dart,erlang,fennel,gdscript3,go,graphql,html,java,javascript,javascriptreact,jsdoc,julia,kotlin.lua,nix,ocaml,php,python,ql,rst,ruby,rust,scala,sparql,teal,toml,turtle,typescript,typescriptreact, verilog",
    "edit | TSBufEnable highlight"
  },
  {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"},
  {"BufWritePre", "MERGE_MSG", "setlocal noundofile"},
  {"BufEnter,FocusGained,InsertLeave", "*", "set relativenumber"},
  {"BufLeave,FocusLost,InsertEnter", "*", "set norelativenumber"},
  {"BufEnter,WinEnter,InsertLeave,VimEnter", "*", "set cursorline"},
  {"BufLeave,WinLeave,InsertEnter", "*", "set nocursorline"},
}

local files = {
  {"BufWritePre", "*.tmp,*.bak", "setlocal noundofile"},
  {"BufLeave", "*", "silent! update"},
  {"BufWritePost", "plugins.lua", "PackerCompile"},
  {"BufWritePost,BufRead", "*.md", "setlocal spell"},
  {"FileType", "py", "set tabstop=4 shiftwidth=4"},
  {"FileType", "which_key", "set nonumber norelativenumber"},
  {"FileType", "NvimTree", "set nonumber norelativenumber"},
  {"FileType", "markdown", "set tabstop=4 shiftwidth=4 conceallevel=2"},
}

local niceties = {
  {"TextYankPost", "*", [[ silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})]]},
  {"BufEnter", "*", "set fo-=c fo-=r fo -=o"},
  {"Syntax", "*", [[if line('$') > 5000 | syntax sync minlines=300 | endif]]},
  {
    "BufWritePost",
    "*",
    [[nested  if &l:filetype ==# '' || exists('b:ftdetect') | unlet! b:ftdetect | filetype detect | endif]]
  },
  {
    "BufReadPost",
    "*",
    [[if &ft !~# 'commit' && ! &diff && line("'\"") >= 1 && line("'\"") <= line("$") | execute 'normal! g`"zvzz' | endif]]
  }
}

local windows = {
  -- Equalize window dimensions when resizing vim window
  {"VimResized", "*", [[tabdo wincmd =]]},
  -- Force write shada on leaving nvim
  {"VimLeave", "*", "wshada!"},
}

local plugins = {
  -- {"CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()"},
  -- {"BufEnter", "*", "lua require('completion').on_attach()"},
  {
    "InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost",
    "*.rs",
    [[ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}} ]]
  },
  -- {"BufEnter", "*", "call v:lua.WhichKey.SetKeyOnFT()"},
}

local definitions = {
  bufs,
  files,
  niceties,
  windows,
  plugins
}

augroups(definitions)
