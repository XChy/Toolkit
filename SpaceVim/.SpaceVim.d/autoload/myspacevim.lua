local layer = require('spacevim.layer')
local opt = require('spacevim.opt')

local keyset = vim.keymap.set
local opts_key = {silent = true, noremap = true, expr = false, replace_keycodes = false}
local opts_expr = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- use systematic clipboard
vim.o.clipboard = 'unnamedplus'

-- Hexmode-related, type ctrl + h to enable hexmode
vim.g.hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.so'
keyset("i", "<C-h>", ':Hexmode<CR>', opts_key)

--- Rainbow, activate rainbow parenthesis
vim.g.rainbow_active = 1

-- coc-yanklist shortcut SPL y
vim.call('SpaceVim#custom#SPC','nnoremap', {'y'}, [[:<C-u>CocList -A --normal yank<cr>]], 'open yanklist', 0)

--some shortcut to program more easy
--easy to be normal
keyset("i","jk",'<Esc>',{})
--easy to jump into implementation
keyset("n","gi",'<C+]>',{})
-- ctrl+a tp select all
keyset("","<C-a>",'ggvG$',{})

--COC AutoComplete
-- shortcut to switch the item to complete
keyset("i","<C-j>",'coc#pum#visible() ? coc#pum#next(1) : "<C-j>"',opts_expr)
keyset("i","<C-k>",'coc#pum#visible() ? coc#pum#prev(1) : "<C-k>"',opts_expr)
keyset("i","<TAB>",[[coc#pum#visible() ? coc#pum#confirm() :coc#expandableOrJumpable() ? "<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "<TAB>"]],opts_expr)

vim.g.coc_snippet_next='<TAB>'
