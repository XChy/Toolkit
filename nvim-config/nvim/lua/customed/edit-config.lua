vim.api.nvim_create_user_command(
    "EditMyConfig",
    function()
        local tree = require('nvim-tree.api').tree
        tree.open()
        tree.change_root("~/.config/nvim/")
    end,
    { nargs = 0 }
)
