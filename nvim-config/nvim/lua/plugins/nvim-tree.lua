local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")
local api = require("nvim-tree.api")
local core = require("nvim-tree.core")

local function update_cwd()
    vim.cmd('cd ' .. core.get_cwd())
end

require('nvim-tree').setup({
    sync_root_with_cwd = true,
    view = {
        width = 30,
        mappings = {
            list = {
                { key = "<C-x>", action = "cwd", action_cb = update_cwd },
            }
        },
    },
    -- hide .git directory
    filters = { custom = { "^.git$" } }
})
