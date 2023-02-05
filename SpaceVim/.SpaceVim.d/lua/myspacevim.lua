local keyset = vim.keymap.set
local opts_key = {silent = true, noremap = true, expr = false, replace_keycodes = false}
local opts_expr = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- use systematic clipboard
vim.o.clipboard = 'unnamedplus'

-- Hexmode-related, type ctrl + h to enable hexmode
vim.g.hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.so'
keyset({"n","i"}, "<C-h>", '<cmd>Hexmode<CR>', opts_key)

--- Rainbow, activate rainbow parenthesis
vim.g.rainbow_active = 1

-- coc-yanklist shortcut SPL y
vim.call('SpaceVim#custom#SPC','nnoremap', {'y'}, [[<cmd>CocList -A --normal yank<cr>]], 'open yanklist', 0)

--some shortcut to program more easy
--easy to be normal
keyset("i","jk",'<Esc>',{})
--easy to jump into implementation
keyset("n","gi",'<C+]>')
-- ctrl+a tp select all
keyset({"i","n","v"},"<C-a>",'<Esc>ggvG$',{})

--COC's autocomplete and coc-ultisnips
-- shortcut to switch the item to complete
keyset("i","<C-j>",[[coc#pum#visible() ? coc#pum#next(1) : "<C-j>"]],opts_expr)
keyset("i","<C-k>",[[coc#pum#visible() ? coc#pum#prev(1) : "<C-k>"]],opts_expr)
keyset("i","<TAB>",[[coc#pum#visible() ? coc#pum#confirm() : UltiSnips#CanJumpForwards() ? "<C-r>=UltiSnips#JumpForwards()<CR>" : "\<TAB>"]],opts_expr)

-- c/c++ switch between header and source
keyset("n","gc",[[<cmd>CocCommand clangd.switchSourceHeader<CR>]],opts_key)

function _G.createHeaderSource(opts)
    local currentFilePath = vim.fn.expand('%')
    print(currentFilePath)
    if #currentFilePath <= 2 then
        print("Cannot create header or source for current file")
        return
    end
    local splitPos=string.find(currentFilePath,'.',1,true)
    local prefix = string.sub(currentFilePath,1,splitPos-1)
    local suffix = string.sub(currentFilePath,splitPos+1,-1)
    if  suffix == 'h' then
        file = io.open(prefix..".cpp","w")
        io.close(file)
        vim.cmd("tabnew "..prefix..".cpp")
    elseif suffix == 'cpp' or suffix == 'c' then
        file = io.open(prefix..".h","w")
        io.close(file)
        vim.cmd("tabnew "..prefix..".h")
    else
        print("Cannot create header or source for current file")
    end

end

function _G.createImpl(opts)
    local symbolInfo = vim.fn.expandcmd('CocCommand clangd.symbolInfo')
    print(symbolInfo)
    end

vim.api.nvim_create_user_command("CreateHS",createHeaderSource, {nargs = 0})
vim.api.nvim_create_user_command("CreateImpl",createImpl, {nargs = 0})

vim.api.nvim_create_user_command("BufferDelete", function()
    ---@diagnostic disable-next-line: missing-parameter
    local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
    local modified = vim.api.nvim_buf_get_option(0, "modified")

    if file_exists == 0 and modified then
        local user_choice = vim.fn.input("The file is not saved, whether to force delete? Press enter or input [y/n]:")
        if user_choice == "y" or string.len(user_choice) == 0 then
            vim.cmd("bd!")
        end
        return
    end

    local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"

    vim.cmd(force and "bd!" or string.format("bp | bd! %s", vim.api.nvim_get_current_buf()))
end, { desc = "Delete the current Buffer while maintaining the window layout" })

-- Nerdtree setting
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '-'

-- examples for your init.lua
