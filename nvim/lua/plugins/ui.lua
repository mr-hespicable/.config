return {
    { "rcarriga/nvim-notify", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    {
        "nvimdev/dashboard-nvim",
        lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
        opts = function()
            local opts = {
                theme = "hyper",
                config = {
                    week_header = {
                        enable = true,
                        concat = "| 兵久而國利者，未之有",
                    },
                    shortcut = {
                        { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
                        {
                            icon = " ",
                            icon_hl = "@variable",
                            desc = "Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            desc = " dotfiles",
                            group = "Number",
                            action = "Neotree action=focus source=filesystem position=float toggle=true dir=/home/leon/.config/",
                            key = "d",
                        },
                    },

                    packages = { enable = true },
                },
            }

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DashboardLoaded",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            return opts
        end,
    },
}
