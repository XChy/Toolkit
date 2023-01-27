function! myspacevim#before() abort
" \"{BasedOnStyle: Google, IndentWidth: 8 }\"
  " let g:neoformat_cpp_clangformat = {
      " \ 'exe': "clang-format",
        " \ 'args': ['--style=file']
      " \ }
  " let g:neoformat_enabled_cpp = ['clangformat']
endfunction

function! myspacevim#after() abort
  " map df tp Esc
  imap df <Esc>
  " map gi to ctrl+]
  nmap gi <C-]>

  inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \  "\<C-j>"
  inoremap <silent><expr> <C-k>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \  "\<C-k>"
endfunction
