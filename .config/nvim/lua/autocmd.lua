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
  {"BufLeave", "*", "silent! update"},
  {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"},
  {"BufWritePre", "MERGE_MSG", "setlocal noundofile"},
  {"BufEnter,WinEnter,InsertLeave", "*", "set cursorline"},
  {"BufLeave,WinLeave,InsertEnter", "*", "set nocursorline"},
  {"BufWritePre", "*", ":call TrimWhitespace()"},
  {"BufWritePost", "plugins.lua", "PlugCompile"},
  {"BufWritePost,BufRead", "*.md", "setlocal spell"},
  {"BufWritePre", "*.tmp,*.bak", "setlocal noundofile"},
  {"BufEnter", "*", "set fo-=c fo-=r fo -=o"},
  {"BufEnter", "*.py", "setlocal tabstop=4 shiftwidth=4"},
  {"BufEnter", "*.md", "setlocal tabstop=4 shiftwidth=4 conceallevel=2"},
}

local files = {
  {"FileType", "python", "noremap <F10> :lua require 'utils.funcs'.RunPython()<CR>"},
  {"FileType", "typescript", "noremap <F10> :lua require 'utils.funcs'.RunTS()<CR>"},
  {"FileType", "javascript", "noremap <F10> :lua require 'utils.funcs'.RunJS()<CR>"},
  {"FileType", "c", "noremap <F10> :!gcc % -o %< && ./%< <CR>"},
  {"FileType", "cpp", "noremap <F10> :!g++ % -o %< && ./%< <CR>"},
  {"FocusLost", "*", "silent! wall"},
  {"BufEnter,FocusGained", "*", "silent! checktime"}
}

local niceties = {
  {"TextYankPost", "*", [[ silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=77})]]},
  {"Syntax", "*", [[if line('$') > 5000 | syntax sync minlines=300 | endif]]},
  {
    "BufWritePost",
    "*",
    [[nested  if &l:filetype ==# '' || exists('b:ftdetect') | unlet! b:ftdetect | filetype detect | endif]]
  },
  -- Remember line number
  {
    "BufReadPost",
    "*",
    [[if &ft !~# 'commit' && ! &diff && line("'\"") >= 1 && line("'\"") <= line("$") | execute 'normal! g`"zvzz' | endif]]
  }
}

local windows = {
  {"TermOpen", "*", "startinsert"},
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
  windows,
  niceties,
  plugins
}

augroups(definitions)
