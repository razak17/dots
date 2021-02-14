if !exists('g:vscode')
  " Helping nvim detect filetype
  let s:additional_filetypes = {
  \   'zsh': '*.zsh*',
  \   'sh': '.env.*',
  \   'bnf': '*.bnf',
  \   'json': '*.webmanifest',
  \   'rest': '*.http',
  \   'elixir': ['*.exs', '*.ex'],
  \ }

  if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  "hi
  highlight LSPCurlyUnderline gui=undercurl
  highlight LSPUnderline gui=underline

  highlight! LspDiagnosticsUnderlineHint gui=undercurl
  highlight! LspDiagnosticsUnderlineInformation gui=undercurl
  highlight! LspDiagnosticsUnderlineWarning gui=undercurl guisp=darkyellow
  highlight! LspDiagnosticsUnderlineError gui=undercurl guisp=red

  highlight! LspDiagnosticsSignHint guifg=yellow
  highlight! LspDiagnosticsSignInformation guifg=lightblue
  highlight! LspDiagnosticsSignWarning guifg=darkyellow
  highlight! LspDiagnosticsSignError guifg=red

  " Binds
  nnoremap <silent> <Leader>vwm :call ColorMyPencils()<CR>
  nnoremap <Leader>aT :call OpenTerminal()<CR>

  " Case-conversion tools
  " shake_case -> camelCase
  nnoremap <silent> <Leader>Cc viw<Leader>cc
  vnoremap <silent> <Leader>Cc :s/\%V_\(.\)/\U\1/g<CR>
  vnoremap <Leader>rev :s/\%V.\+\%V./\=RevStr(submatch(0))<CR>gv

  " snake_case -> PascalCase
  nnoremap <silent> <Leader>CP viw<Leader>CP
  vnoremap <silent> <Leader>CP <Leader>cc`<vU

  " camelCase/PascalCase -> snake_case
  nmap <silent> <Leader>Cs viw<Leader>Cs
  vnoremap <silent> <Leader>Cs :s/\%V\(\l\)\(\u\)/\1_\l\2/g<CR>`<vu

" snake_case -> kebab-case
" TODO: implement

  " augroup LSP_highlight
    " autocmd!
    " au CursorHold <buffer> silent! lua vim.lsp.buf.document_highlight()
    " au CursorHoldI <buffer> silent! lua vim.lsp.buf.document_highlight()
    " au FileType typescriptreact setlocal commentstring=//\ %s
  " augroup END

  " autocmd
  augroup Razak_Mo
    autocmd!
    " au TermOpen * startinsert
    au BufWritePre * :call TrimWhitespace()
    " au CursorMoved * lua require 'lsp.utils'.show_lsp_diagnostics()
    " au CursorMoved * :echo mode()
    " au CursorMoved * :echo exists('g:vscode')
    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
     \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
  augroup END
endif
