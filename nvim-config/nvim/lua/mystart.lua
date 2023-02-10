-- lazy's installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require('options')
require("lazy").setup({
    {
        "folke/which-key.nvim",
        config = function()
            require('which-key').setup({
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "a" } })
        end },
    { "nvim-tree/nvim-web-devicons" },
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            vim.notify = require('notify')
        end
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = false
    },
    {
        'akinsho/bufferline.nvim', dependencies = { { 'nvim-tree/nvim-web-devicons' } }, lazy = false,
        -- 左侧让出 nvim-tree 的位置
        options = { offsets = { {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        } } },
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup {}
        end
    },
    --{
    --'karb94/neoscroll.nvim', lazy = false,
    --config = function()
    --require('neoscroll').setup()
    --end
    --},
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function()
            require('plugins-customed.dashboard')
        end
    },
    {
        "powerman/vim-plugin-AnsiEsc",
        lazy = false
    },
    --{
    --'goolord/alpha-nvim',
    --config = function()
    --require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    --end
    --},
    {
        "Shatur/neovim-session-manager",
        cmd = 'SessionManager',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('session_manager').setup({})
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'BufEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function()
            require('lualine').setup({
                options = { theme = 'nightfly' }
            })
        end,
    },
    {
        "bluz71/vim-nightfly-colors",
        config = function()
            vim.cmd([[colorscheme nightfly]])
        end
    },
    {
        'luochen1990/rainbow',
        lazy = false,
        config = function() require('plugins-customed.rainbow') end
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        cmd = { 'TodoLocList', 'TodoQuickFix', 'TodoTelescope', 'TodoTrouble' },
        config = function()
            require("todo-comments").setup {}
        end
    },
    { "folke/neoconf.nvim",         cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function() require("plugins-customed.nvim-tree") end
    },
    { 'nvim-telescope/telescope-project.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.1',
        Lazy = true,
        cmd = 'Telescope',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('telescope').load_extension('project')
            extensions = {
                project = {
                    base_dirs = {
                        '~/Projects/*'
                    },
                    sync_with_nvim_tree = true
                },
            }
        end
    },
    {
        'preservim/nerdcommenter',
        Lazy = false,
    },
    { 'lukas-reineke/indent-blankline.nvim',  event = 'VeryLazy' },
    {
        "akinsho/toggleterm.nvim", version = '*',
        cmd = { [[ToggleTerm]], [[LazyGit]], [[Top]] },
        config = function()
            require("toggleterm").setup({
                terminal_mappings = false,
                start_in_insert = true,
                direction = 'horizontal'
            })
            require('plugins-customed.terminal')
        end
    },
    {
        "folke/noice.nvim",
        lazy = false,
        config = function()
            require("noice").setup({
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        keys = { '<F5>', '<F9>' },
        config = function()
            require('plugins-customed.dap')
        end
    },
    {
        "neoclide/coc.nvim",
        dependencies = { "SirVer/ultisnips" },
        lazy = false,
        config = function()
        end,
        branch = 'release'
    }
})


-- customed configuration
require('basic')
require('keybindings')
require('plugins-customed.coc')

-- load all customed lua
local files = io.popen("ls ~/.config/nvim/lua/customed/")
if files ~= nil then
    for filename in files:lines() do
        require('customed.' .. string.sub(filename, 1, string.find(filename, '.', 1, true) - 1))
    end
end

if files then
    files:close()
else
    require('basic').notify("Failed loadingthe customed module")
end
