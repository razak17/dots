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
    "bash,c,cs,cpp,css,go,graphql,html,javascript,javascriptreact,jsdoc,julia,lua,python,rust,typescript,typescriptreact",
    "edit | TSBufEnable highlight"
  },
  {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"},
  {"BufWritePre", "MERGE_MSG", "setlocal noundofile"},
  {"BufEnter,FocusGained,InsertLeave", "NvimTree", "set norelativenumber"},
  {"BufEnter,FocusGained,InsertLeave", "WhichKey", "set norelativenumber"}, -- TODO
  {"BufEnter,FocusGained,InsertLeave", "dashboard", "set norelativenumber"}, -- TODO
  {"BufEnter,FocusGained,InsertLeave", "Telescope", "set norelativenumber"}, -- TODO
  {"BufEnter,FocusGained,InsertLeave", "*", "set relativenumber"},
  {"BufLeave,FocusLost,InsertEnter", "*", "set norelativenumber"},
  {"BufEnter,WinEnter,InsertLeave,VimEnter", "*", "set cursorline"},
  {"BufLeave,WinLeave,InsertEnter", "*", "set nocursorline"},
  {"BufWritePre", "*", ":call TrimWhitespace()"},
  {"BufWritePost", "plugins.lua", "PlugCompile"},
  {"BufWritePost,BufRead", "*.md", "setlocal spell"},
  {"BufWritePre", "*.tmp,*.bak", "setlocal noundofile"},
  {"BufEnter", "*", "set fo-=c fo-=r fo -=o"},
}

local files = {
  {"TermOpen", "*", "startinsert"},
  {"BufLeave", "*", "silent! update"},
  -- {"FileType", "*", "set showtabline=2"},
  {"FileType", "py", "set tabstop=4 shiftwidth=4"},
  {"FileType", "markdown", "set tabstop=4 shiftwidth=4 conceallevel=2"},
  {"FileType", "python", "noremap <F10> :lua require 'utils.funcs'.RunPython()<CR>"},
  {"FileType", "typescript", "noremap <F10> :lua require 'utils.funcs'.RunTS()<CR>"},
  {"FileType", "javascript", "noremap <F10> :lua require 'utils.funcs'.RunJS()<CR>"},
  {"FileType", "c", "noremap <F10> :!gcc % -o %< && ./%< <CR>"},
  {"FileType", "cpp", "noremap <F10> :!g++ % -o %< && ./%< <CR>"},
}

local niceties = {
  {"TextYankPost", "*", [[ silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})]]},
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
  {
    "InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost",
    "*.rs",
    [[ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}} ]]
  },
  {"BufEnter", "*", "call v:lua.WhichKey.SetKeyOnFT()"},
}

local definitions = {
  bufs,
  files,
  niceties,
  windows,
  plugins
}

augroups(definitions)
