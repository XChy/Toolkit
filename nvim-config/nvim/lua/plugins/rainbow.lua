vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        pattern = { "*.c", "*.cpp", "*.h", "*.py", "*.lua", "*.java" },
        command = "RainbowToggleOn"
    }
)
