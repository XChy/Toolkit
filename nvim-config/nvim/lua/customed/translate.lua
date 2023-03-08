local api = vim.api
local utils = require('basic')
local Job = require('plenary.job')

-- the console colored font is relied on https://github.com/powerman/vim-plugin-AnsiEsc
local function translate_word()
    local mode = vim.api.nvim_get_mode()['mode']
    local word = ""
    if mode == 'n' then
        word = vim.fn.expand('<cword>')
    else
        word = utils.get_visual_selection()
    end

    Job:new({
        command = 'wd',
        args = { word },
        on_exit = function(job, return_val)
            local translated_content = job:result()
            vim.schedule(function()
                utils.show_term_content(translated_content, "FindWord")
            end)
        end
    }):start()
end

local function translate_terminal()
    local mode = vim.api.nvim_get_mode()['mode']
    local to_translate
    if mode == 'n' then
        to_translate = vim.fn.expand('<cword>')
    elseif mode == 'v' then
        to_translate = require('basic').get_visual_selection()
    end

    Job:new({
        command = 'trans',
        args = { to_translate },
        on_exit = function(job, return_val)
            local translated_content = job:result()
            vim.schedule(function()
                utils.show_term_content(translated_content, "Translator")
            end)
        end
    }):start()
end

api.nvim_create_user_command("Wd", translate_word, { nargs = 0, range = true })
api.nvim_create_user_command("Trans", translate_terminal, { nargs = 0, range = true })
