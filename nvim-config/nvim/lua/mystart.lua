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
    {
        'karb94/neoscroll.nvim', lazy = false,
        config = function()
            require('neoscroll').setup()
        end
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function()
            require('plugins.dashboard')
        end
    },
    {
        "preservim/tagbar", cmd = { 'TagbarToggle' }
    },
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
        config = function() require('plugins.rainbow') end
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
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
        config = function() require("plugins.nvim-tree") end
    },
    { 'nvim-telescope/telescope-project.nvim' },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.1',
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
        keys = { { '<leader>c<Space>' } }
    },
    {
        'tanvirtin/vgit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        cmd          = { 'VGit' },
        config       = function()
            require('vgit').setup()
        end
    },
    {
        'kdheepak/lazygit.nvim', lazy = true,
        cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
        config = function()
            require('telescope').load_extension('lazygit')
        end
    },
    { 'lukas-reineke/indent-blankline.nvim',  event = 'VeryLazy' },
    { "akinsho/toggleterm.nvim", version = '*', keys = { [[<leader>']] },
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<leader>']],
                terminal_mappings = false,
                start_in_insert = true,
                direction = 'horizontal'
            })
        end },
    {
        "SirVer/ultisnips"
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        keys = { '<F5>', '<F9>' },
        config = function()
            require('plugins.dap')
        end
    },
    {
        "neoclide/coc.nvim",
        lazy = false,
        config = function()
        end,
        branch = 'release'
    }
})


-- customed configuration
require('basic')
require('keybindings')
require('plugins.coc')

-- load all customed lua
local files = io.popen("ls ~/.config/nvim/lua/customed/")
if files ~= nil then
    for filename in files:lines() do
        require('customed.' .. string.sub(filename, 1, string.find(filename, '.', 1, true) - 1))
    end
end
