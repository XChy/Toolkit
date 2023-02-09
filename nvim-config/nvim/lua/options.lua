-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- nobackup
vim.g.backup = false
vim.g.writebackup = false

-- apply number of columns
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight current line
vim.o.cursorline = true

-- use systematic clipboard
vim.o.clipboard = 'unnamedplus'

-- leader key
vim.g.mapleader = " "

-- tab-related
vim.api.nvim_set_option("tabstop", 4)
vim.api.nvim_set_option("softtabstop", 4)
vim.api.nvim_set_option("shiftwidth", 4)

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- ui font
vim.api.nvim_set_option("guifont", 'Droid Sans Mono Nerd Font:h16')
vim.opt.termguicolors = true



-- reduce update time
vim.opt.updatetime = 300

-- mouse support
vim.o.mouse = "a"

-- Hexmode
vim.g.hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.so'

-- Rainbow
vim.g.rainbow_active = 1
