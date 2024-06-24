return {
    { "rcarriga/nvim-notify", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    {
        "nvimdev/dashboard-nvim",
        lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
        opts = function()
            local opts = {
                theme = "hyper",
                disable_move = true,
                config = {
                    week_header = {
                        enable = true,
                        concat = ": 兵久而國利者，未之有",
                    },
                    shortcut = {
                        { desc = "󰊳 update", group = "String", action = "Lazy update", key = "u" },
                        {
                            icon = "",
                            icon_hl = "@variable",
                            desc = "files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            desc = " config",
                            group = "@property",
                            action = "Telescope find_files cwd=/home/leon/.config/nvim/",
                            key = "c",
                        },
                        {
                            desc = "❌ quit",
                            group = "Number",
                            action = "quit",
                            key = "q",
                        },
                    },
                    projects = {
                        enable = true,
                        limit = 8,
                        action = "Telescope find_files cwd=",
                    },
                    packages = { enable = false },
                    footer = {
                        "",
                        "🚀 切れる道具は良い仕事をする",
                    },
                },
                preview = {
                    file_height = 50,
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
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
            cmdline = {
                enabled = true,
                view = "cmdline",
            },
        },
        -- stylua: ignore
        keys = {
            { "<leader>sn", "", desc = "+noice"},
            { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
            { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
            { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
            { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
            { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
        },
    },
}
