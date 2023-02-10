local M = {}

-- get the visual selected lines
---@return string[]
function M.get_visual_selection_lines()
    local _start = vim.fn.getpos('v')
    local _end = vim.fn.getcurpos()

    -- reverse start and end if start is behind the end
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

-- get the visual selected text
---@return string
function M.get_visual_selection()
    return table.concat(M.get_visual_selection_lines(), '\n')
end

-- show the string of content in form of console font
-- support colored font in terminal
--- @param content:string[]
function M.show_term_content(content)
    local buf = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, content)
    local win = vim.api.nvim_open_win(buf, true, {
            relative = 'cursor',
            style = 'minimal',
            row = 0,
            col = 0,
            width = 60,
            height = #content,
            border = 'single'
        })
    -- TODO make float window close when not focused
    vim.cmd [[AnsiEsc]]
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'modified', false)
    vim.api.nvim_buf_set_option(buf, 'buflisted', false)
end

return M
