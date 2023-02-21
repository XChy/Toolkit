vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        pattern = { '*.sh', "*.c", "*.cpp", "*.h", "*.py", "*.lua", "*.java" },
        command = "RainbowToggleOn"
    }
)
