local keyset = vim.keymap.set
local g = vim.g
local opts_key = { silent = true, noremap = true, expr = false, replace_keycodes = false }
local opts_expr = { silent = true, noremap = true, expr = true, replace_keycodes = false }

--easy to be normal
keyset("i", "jk", '<Esc>', {})
--easy to jump into implementation
keyset("n", "gi", '<C+]>')
-- ctrl+a tp select all
keyset({ "i", "n", "v" }, "<C-a>", '<Esc>gg^vG$', {})


--NvimTree's
keyset("n", "<F3>", [[<cmd>NvimTreeToggle<CR>]], opts_key)

-- c/c++ switch between header and source
keyset("n", "gc", [[<cmd>CocCommand clangd.switchSourceHeader<CR>]], opts_key)

-- windows and terminal in window
keyset({ "n", "t" }, "<A-h>", "<cmd> wincmd h<cr>", opts_key)
keyset({ "n", "t" }, "<A-j>", "<cmd> wincmd j<cr>", opts_key)
keyset({ "n", "t" }, "<A-k>", "<cmd> wincmd k<cr>", opts_key)
keyset({ "n", "t" }, "<A-l>", "<cmd> wincmd l<cr>", opts_key)

--buffers
keyset("n", "<leader>q", "<cmd>BufferDelete<cr>", opts_key)
keyset("t", "<C-d>", "<cmd>BufferDelete<cr>", opts_key)

-- Telescope
local builtin = require('telescope.builtin')
keyset('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
keyset('n', '<leader>fg', builtin.live_grep, { desc = 'Grep' })
keyset('n', '<leader>fb', builtin.buffers, { desc = 'Find files in buffers' })
keyset('n', '<leader>fh', builtin.help_tags, { desc = 'help tags' })
keyset('n', '<leader>fo', builtin.oldfiles, { desc = 'Find in old files' })
keyset('n', '<leader>p', "<cmd>Telescope project<cr>", { desc = 'List project' })

-- Buffer-line
keyset("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts_key)
keyset("n", "<C-l>", ":BufferLineCycleNext<CR>", opts_key)

-- TodoComment
keyset("n", "<leader>to", "<cmd>TodoLocList<cr>", { desc = 'Open todolist' })

-- VGit
keyset({ "n" }, "<leader>gc", "<cmd>VGit project_commit_preview<CR>", opts_key)
keyset({ "n" }, "<leader>gd", "<cmd>VGit project_diff_preview<CR>", opts_key)
keyset({ "n" }, "<leader>gs", "<cmd>VGit project_stage_all<CR>", opts_key)
-- LazyGit
keyset({ "n" }, "<leader>gl", "<cmd>LazyGit<CR>", opts_key)

--ToggleTerminal
keyset({ "n" }, "<leader>'", "<cmd>ToggleTerm<CR>", opts_key)

--Noice
keyset({ "n" }, "<leader>m", "<cmd><CR>", opts_key)

---- Customed
-- Switch to customed config
vim.keymap.set("n", "<leader>con", "<cmd>EditMyConfig<cr>", opts_key)

-- Translate
vim.keymap.set({ "n", "v" }, "gw", "<cmd>Wd<cr>", opts_key)
vim.keymap.set({ "n", "v" }, "gt", "<cmd>Trans<cr>", opts_key)
