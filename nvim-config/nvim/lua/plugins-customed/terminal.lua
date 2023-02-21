local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
local top = Terminal:new({ cmd = "top", direction = 'float', hidden = true })


-- lazygit
vim.api.nvim_create_user_command("LazyGit",
    function()
        lazygit:toggle()
    end,
    { nargs = 0 })

-- top
vim.api.nvim_create_user_command("Top",
    function()
        top:toggle()
    end,
    { nargs = 0 })
