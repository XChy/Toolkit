vim.api.nvim_create_user_command(
    "BufferDelete",
    function()
        ---@diagnostic disable-next-line: missing-parameter
        local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
        local modified = vim.api.nvim_buf_get_option(0, "modified")

        if file_exists == 0 and modified then
            local user_choice = vim.fn.input(
                    "The file is not saved, whether to force delete? Press enter or input [y/n]:")
            if user_choice == "y" or string.len(user_choice) == 0 then
                vim.cmd("bd!")
            end
            return
        end

        local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"

        vim.cmd(force and "bd!" or string.format("bp | bd! %s", vim.api.nvim_get_current_buf()))
    end,
    { desc = "Delete the current Buffer while maintaining the window layout" })

local tool_pattern = { 'NvimTree_', 'CocTree', '#toggleterm#' }

local function match_tool(str)
    for _, pattern in pairs(tool_pattern) do
        if str:match(pattern) ~= nil then
            return true
        end
    end
    return false
end

local function autoclose()
    local wins = vim.api.nvim_list_wins()
    local canQuit = true
    for _, win_id in pairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win_id)
        if vim.api.nvim_buf_get_option(buf, 'buflisted') then
            return
        end
        --local win_name = vim.api.nvim_buf_get_name(buf)
        --if not match_tool(win_name) then
        --canQuit = false
        --break
        --end
    end

    if canQuit then
        vim.cmd "quit"
    end
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = autoclose,
    nested = true
})
