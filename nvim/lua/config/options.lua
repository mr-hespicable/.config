-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.cmd.highlight({ args = { "link DashboardHeader MoonbowOrange" }, bang = true })
    end,
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.wo.conceallevel = 0
    end,
})
