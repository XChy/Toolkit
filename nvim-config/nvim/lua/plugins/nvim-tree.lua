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

-- close the nvim-tree if the tree is the  last buffer/window
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    pattern = "NvimTree_*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(
                vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
            and layout[3] == nil then
            vim.cmd("confirm quit")
        end
    end
})
