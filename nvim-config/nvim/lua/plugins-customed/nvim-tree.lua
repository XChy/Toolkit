local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")
local api = require("nvim-tree.api")
local core = require("nvim-tree.core")

local function update_cwd()
    vim.api.nvim_set_current_dir(core.get_cwd())
    vim.notify('Current working directory switched to ' .. core.get_cwd(), 'info')
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
    git = {
        ignore = false
    },
    -- hide .git directory
    filters = {
        custom = { "^.git$", "CMakeCache.txt", "cmake_install.cmake", "CMakeFiles", ".vscode", "CTestTestfile.cmake" } }
})
