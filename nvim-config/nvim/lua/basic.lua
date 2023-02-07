local modes = {
    trace = vim.log.levels.TRACE,
    info = vim.log.levels.info,
    warn = vim.log.levels.WARN,
    debug = vim.log.levels.DEBUG,
    error = vim.log.levels.ERROR,
}

-- msg:string level:string
local function notify(msg, level)
    vim.notify(msg, modes[level])
end
