local Terminal = require('toggleterm.terminal').Terminal

local top = Terminal:new({
    cmd = "top",
    direction = 'float',
    hidden = true,
})


-- lazygit
vim.api.nvim_create_user_command("LazyGit",
    function()
        local lazygit = Terminal:new({
            cmd = 'lazygit',
            dir = vim.fn.getcwd(),
            direction = 'float',
            hidden = true,
            on_open = function(term)
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        lazygit:open()
    end,
    { nargs = 0 })

-- top
vim.api.nvim_create_user_command("Top",
    function()
        top:toggle()
    end,
    { nargs = 0 })
