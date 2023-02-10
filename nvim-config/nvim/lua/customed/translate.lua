local api = vim.api
local utils = require('basic')
local notify = utils.notify

-- the console colored font is relied on https://github.com/powerman/vim-plugin-AnsiEsc
local function translate_word()
    local mode = vim.api.nvim_get_mode()['mode']
    local word
    if mode == 'n' then
        word = vim.fn.expand('<cword>')
    else
        word = utils.get_visual_selection()
    end

    local translated_content = vim.fn.systemlist('wd ' .. word)

    utils.show_term_content(translated_content)
end

local function translate_google()
    local mode = vim.api.nvim_get_mode()['mode']
    local to_translate
    if mode == 'n' then
        to_translate = vim.fn.expand('<cword>')
    elseif mode == 'v' then
        to_translate = require('basic').get_visual_selection()
    end

    local command = string.format('trans "%s"', to_translate)
    local translated_content = vim.fn.systemlist(command)

    utils.show_term_content(translated_content)
end

api.nvim_create_user_command("Wd", translate_word, { nargs = 0, range = true })
api.nvim_create_user_command("Trans", translate_google, { nargs = 0, range = true })
