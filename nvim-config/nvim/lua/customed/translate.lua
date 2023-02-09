local api = vim.api
local my = require('basic')
local notify = my.notify

local function translate_word()
    local mode = vim.api.nvim_get_mode()['mode']
    local word
    if mode == 'n' then
        word = vim.fn.expand('<cword>')
    else
        word = my.get_visual_selection()
    end

    local translated_content = vim.fn.systemlist('wd ' .. word)
    --api.nvim_open_term(buf, {})

    buf = api.nvim_create_buf(true, false)
    api.nvim_buf_set_text(buf, 0, 0, 0, 0, translated_content)
    local win = api.nvim_open_win(buf, false, {
            relative = 'cursor', style = 'minimal', row = 0, col = 0, width = 60, height = #translated_content
        })
    api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(buf, 'modified', false)
    api.nvim_buf_set_option(buf, 'buflisted', false)
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
    local job = vim.fn.jobstart({ command }, {})
    local translated_content = vim.fn.system(command)
    notify(translated_content, 'info')

    --buf = api.nvim_create_buf(true, false)
    --api.nvim_buf_set_text(buf, 0, 0, 0, 0, translated_content)
    --local win = api.nvim_open_win(buf, false, {
    --relative = 'cursor',
    --style = 'minimal',
    --row = 0,
    --col = 0,
    --width = 60,
    --height = #translated_content,
    --focusable = false
    --})
    --api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    --api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    --api.nvim_buf_set_option(buf, 'modified', false)
    --api.nvim_buf_set_option(buf, 'buflisted', false)
end

api.nvim_create_user_command("Wd", translate_word, { nargs = 0, range = true })
api.nvim_create_user_command("Trans", translate_google, { nargs = 0, range = true })
