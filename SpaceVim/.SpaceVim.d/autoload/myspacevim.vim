
function! myspacevim#before() abort
    " shortcut and filetypes for hex editor
    " noremap <C-h> :Hexmode<CR>
    " let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.so'
    " copy to systematic clipboard
    " set clipboard=unnamedplus
    " activate rainbow parenthesis
    " let g:rainbow_active = 1
    " space + y to open yanklist
    " call SpaceVim#custom#SPC('nnoremap', ['y'], ':<C-u>CocList -A --normal yank<cr>', 'open yanklist', 0)

    :luafile ~/.SpaceVim.d/autoload/myspacevim.lua
endfunction




function! myspacevim#after() abort
    " map jk tp Esc
    " easy to be normal
    " imap jk <Esc>
    " map gi to ctrl+]
    " jump into implementation
    " nmap gi <C-]>

    " ctrl + a = select all
    " map <C-A> ggvG$

    "coc-related menu up and down
    " inoremap <silent><expr> <C-j>
      " \ coc#pum#visible() ? coc#pum#next(1) :
      " \  "\<C-j>"
    " inoremap <silent><expr> <C-k>
      " \ coc#pum#visible() ? coc#pum#prev(1) :
      " \  "\<C-k>"
    " inoremap <silent><expr> <TAB>
      " \ coc#pum#visible() ? coc#pum#confirm() :
        " \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      " \  "\<TAB>"

    "jump between snippet's placehold when typing tab
    " let g:coc_snippet_next = '<TAB>'

endfunction
