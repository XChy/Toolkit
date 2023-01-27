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
endfunction
