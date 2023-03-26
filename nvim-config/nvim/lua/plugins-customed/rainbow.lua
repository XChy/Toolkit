vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        pattern = { '*.xsharp', '*.sh', "*.c", "*.cpp", "*.h", "*.py", "*.lua", "*.java", "*.rs" },
        command = "RainbowToggleOn"
    }
)
