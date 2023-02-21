local blog_path = "~/Documents/Hexo-Blog"

local function blogNew(input)
    vim.api.nvim_set_current_dir(blog_path)
    require('nvim-tree.api').tree.change_root(blog_path)
    local output = vim.fn.system("hexo n " .. '\"' .. input.args .. '\"')

    if (vim.v.shell_error == 0) then
        local path = string.sub(output, string.find(output, '~', 1, true), -1)
        vim.cmd(":e " .. path)
    else
        vim.notify("Failed creating new blog post" .. input.args, "error")
    end
end

local function blogNewDraft(input)
    vim.api.nvim_set_current_dir(blog_path)
    require('nvim-tree.api').tree.change_root(blog_path)
    local output = vim.fn.system("hexo new draft " .. '\"' .. input.args .. '\"')

    if (vim.v.shell_error == 0) then
        local path = string.sub(output, string.find(output, '~', 1, true), -1)
        vim.cmd(":e " .. path)
    else
        vim.notify("Failed creating new blog post" .. input.args, "error")
    end
end

local function blogGenerateAndDeploy()
    vim.api.nvim_set_current_dir(blog_path)
    if (os.execute("hexo g && hexo s")) then
        vim.notify("Deploy the blog successfully", "info")
    else
        vim.notify("Deployment of blog failed", "error")
    end
end

local function blogEdit()
    local tree = require('nvim-tree.api').tree
    tree.open()
    tree.change_root(blog_path)
end

vim.api.nvim_create_user_command("HexoNew", blogNew, { nargs = 1 })
vim.api.nvim_create_user_command("HexoNewDraft", blogNewDraft, { nargs = 1 })
vim.api.nvim_create_user_command("HexoPush", blogGenerateAndDeploy, { nargs = 0 })
vim.api.nvim_create_user_command("HexoOpen", blogEdit, { nargs = 0 }
)
