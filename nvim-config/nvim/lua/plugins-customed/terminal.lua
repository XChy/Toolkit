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

-- translator
vim.api.nvim_create_user_command("Wd",
    function()
        local mode = vim.api.nvim_get_mode()['mode']
        local word
        if mode == 'n' then
            word = vim.fn.expand('<cword>')
        else
            word = require('basic').get_visual_selection()
        end
        local wd = Terminal:new({
                cmd = 'wd ' .. word .. '| more',
                direction = 'float',
                hidden = true,
                close_on_exit = false,
                auto_scroll = false,
                float_opts = {
                    relative = 'cursor'
                }
            })
        wd:open()
    end,
    { nargs = 0 })
