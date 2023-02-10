local keyset = vim.keymap.set
local g = vim.g
local opts_key = { silent = true, noremap = true, expr = false, replace_keycodes = false }
local opts_expr = { silent = true, noremap = true, expr = true, replace_keycodes = false }

--COC's main part
--
--

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gR", "<Plug>(coc-references)", { silent = true })
----

------- Code action
-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", {})
-- Remap keys for apply code actions affect whole buffer.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", {})
keyset("n", "gr", "<Plug>(coc-rename)", { silent = true })
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset({ "x", "n" }, "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
-------

-- Code's Documentation
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
----


---- Coc's yanklist
keyset("n", "<leader>y", [[<cmd>CocList -A --normal yank<cr>]], { silent = true, noremap = true, desc = 'open yanklist' })

---- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
---

--- Use Tab for trigger completion with characters ahead and navigate
keyset("i", "<C-j>", [[coc#pum#visible() ? coc#pum#next(1) : "<C-j>"]], opts_expr)
keyset("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-k>"]], opts_expr)
keyset("i", "<TAB>",
    [[coc#pum#visible() ? coc#pum#confirm() : UltiSnips#CanJumpForwards() ? "<C-r>=UltiSnips#JumpForwards()<CR>" : "\<TAB>"]]
    , opts_expr)
------

--- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

--- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
keyset("n", "<leader>lf", "<cmd>call CocAction('fold')<cr>", opts_key)

--- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

--- Outline support
--- see keymappings with :h coc-tree-mappings and coc-outline
local function toggleOutline()
    local winid = vim.call('coc#window#find', 'cocViewId', 'OUTLINE')
    if winid == -1 then
        vim.call('CocActionAsync', 'showOutline', 1)
    else
        vim.call('coc#window#close', winid)
    end
end
keyset("n", "<F2>", toggleOutline, {})
