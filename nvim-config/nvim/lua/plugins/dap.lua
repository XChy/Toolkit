local keyset = vim.keymap.set
local dap, dapui = require('dap'), require('dapui')

keyset({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.continue()<CR>", { silent = true, noremap = true })
keyset({ "i", "n", "v" }, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
keyset({ "i", "n", "v" }, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
keyset({ "i", "n", "v" }, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
keyset({ "i", "n", "v" }, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    { silent = true, noremap = true, buffer = bufnr })


-- auto open dapui
dapui.setup()
initArgs = {}

dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
        initArgs = {}
        dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
        initArgs = {}
        dapui.close()
end

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/xchy/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}

function split(str, reps)
        local resultStrList = {}
        string.gsub(str, '[^' .. reps .. ']+', function(w)
                table.insert(resultStrList, w)
        end)
        return resultStrList
end

function getInitArgs()
        if #initArgs == 0 then
                initArgs = split(vim.fn.input('Path to executable and args:', vim.fn.getcwd() .. '/'), ' ')
        end
        return initArgs
end

-- c/c++ configurations
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
                return getInitArgs()[1]
        end,
        cwd = '${workspaceFolder}',
        console = 'externalTerminal',
        args = function()
                return { unpack(getInitArgs(), 2) }
        end,
        stopAtEntry = true,
    }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.python = {
    {
        name = "Launch file",
        type = "python",
        request = "launch",
        program = function()
                return getInitArgs()[1]
        end,
        cwd = '${workspaceFolder}',
        console = 'externalTerminal',
        args = function()
                return { unpack(getInitArgs(), 2) }
        end,
        stopAtEntry = true,
    }
}

-- python configurations

-- To beautify ui
local dap_breakpoint_color = {
    breakpoint = {
        ctermbg = 0,
        fg = '#993939',
        bg = '#31353f',
    },
    logpoing = {
        ctermbg = 0,
        fg = '#61afef',
        bg = '#31353f',
    },
    stopped = {
        ctermbg = 0,
        fg = '#98c379',
        bg = '#31353f'
    },
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = 'ﳁ',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '▶',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '▶',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
