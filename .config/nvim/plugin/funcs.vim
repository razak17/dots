if !exists('g:vscode')
  fun! OpenTerminal()
    split term://zsh
    resize 10
  endfunction

  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  fun! s:buf_filt(inc_cur)
    fun! s:filt_fn(include_current, idx, val)
      if !bufexists(a:val) ||
      \ !buflisted(a:val) ||
      \ buffer_name(a:val) =~? 'nvim_tree_*' ||
      \ (a:include_current && bufnr() == a:val)
        return v:false
      endif
      return v:true
    endfunction
    return filter(range(1, bufnr('$')), function('s:filt_fn', [a:inc_cur]))
  endfunction

  fun! s:DellAllBuf()
    wall
    silent execute 'bdelete ' . join(s:buf_filt(0))
  endfunction

  fun! s:DellThisBuf()
    update
    bprevious | split | bnext | bdelete
  endfunction

  " Delete buffers except current
  fun! s:DelAllExcept()
    wall
    silent execute 'bdelete' join(s:buf_filt(1))
  endfunction

  " TODO
  fun! s:DelToLeft()
    silent execute 'bdelete' join(range(1, bufnr() - 1))
  endfunction

  fun RevStr(str)
    let l:chars = split(submatch(0), '\zs')
    return join(reverse(l:chars), '')
  endfunction

  fun! ColorMyPencils()
    set background=dark

    highlight Normal guibg=none
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
  endfun

  fun! RunPython()
    let s:current_file = expand("%")
    enew|silent execute ".!python " . shellescape(s:current_file, 1)
    setlocal buftype=nofile bufhidden=wipe noswapfile nowrap
    setlocal nobuflisted
  endfunction

  fun Run()
    exec "! node %"
  endfunction

  fun RunT()
    exec "! ts-node %"
  endfunction

  autocmd FileType typescript noremap <F10> :call RunT() <cr>
  autocmd FileType python noremap <F10> :call RunPython()<CR>
  autocmd FileType c noremap <F10> :!gcc % -o %< && ./%< <CR>
  autocmd FileType cpp noremap <F10> :!g++ % -o %< && ./%< <CR>
  autocmd FileType javascript noremap <F10> :call Run() <cr>

  " Vim with me
  nnoremap <silent> <Leader>d  :call <SID>DellThisBuf()<CR>
  nnoremap <silent> <Leader>ld :call <SID>DellAllBuf()<CR> :q!<CR>
  nnoremap <silent> <Leader>lh :call <SID>DelToLeft()<CR>
  nnoremap <silent> <Leader>lx :call <SID>DelAllExcept()<CR>
endif


