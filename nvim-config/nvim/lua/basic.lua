local M = {}
local modes = {
    trace = vim.log.levels.TRACE,
    info = vim.log.levels.info,
    warn = vim.log.levels.WARN,
    debug = vim.log.levels.DEBUG,
    error = vim.log.levels.ERROR,
}

-- msg:string level:string
---@param msg:string
---@param level:string
function M.notify(msg, level)
    vim.notify(msg, modes[level])
end

-- a easy function to get the visual selection
---@return string[]
function M.get_visual_selection_lines()
    local _start = vim.fn.getpos('v')
    local _end = vim.fn.getcurpos()
    if _start[2] > _end[2] then
        _start, _end = _end, _start
    elseif _start[2] == _end[2] and _start[3] > _end[3] then
        _start, _end = _end, _start
    end

    local lines = vim.api.nvim_buf_get_text(0,
            _start[2] - 1, _start[3] - 1,
            _end[2] - 1, _end[3], {})

    return lines
end

--
---@return string
function M.get_visual_selection()
    return table.concat(M.get_visual_selection_lines(), '\n')
end

return M
