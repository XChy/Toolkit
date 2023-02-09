local utils = require('basic')

local function git_stage_all()
    local command = string.format('git add "%s"', vim.cmd [[getcwd()]])
    local result = vim.fn.system(command)
    local opts = { title = 'Git Stage All' }
    if vim.v.shell_error == 0 then
        vim.notify(result, 'info', opts)
    else
        vim.notify(result, 'error', opts)
    end
end

local function git_push()
    local result = vim.fn.system('git push')
    local opts = { title = 'Git Push' }
    if vim.v.shell_error == 0 then
        vim.notify(result, 'info', opts)
    else
        vim.notify(result, 'error', opts)
    end
end
