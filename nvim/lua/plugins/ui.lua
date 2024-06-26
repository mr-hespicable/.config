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
        enabled = false,
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                message = {
                    enabled = false,
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
            notify = {
                enabled = true,
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
    {
        "nvim-lualine/lualine.nvim",
        event = function()
            return "UIEnter"
        end,
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            -- PERF: we don't need this lualine require madness 🤷
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            local colors = {
                bg = "#202328",
                fg = "#bdae93",
                yellow = "#fabd2f",
                cyan = "#008080",
                darkblue = "#076678",
                green = "#b8bb26",
                orange = "#fe8019",
                violet = "#d3869b",
                magenta = "#c678dd",
                blue = "#83a598",
                red = "#fb4934",
            }

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand("%:p:h")
                    local gitdir = vim.fn.finddir(".git", filepath .. ";")
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }

            local config = {

                options = {
                    -- Disable sections and component separators
                    component_separators = "",
                    section_separators = "",
                    theme = { -- We are going to use lualine_c an lualine_x as left and
                        -- right section. Both are highlighted by c theme .  So we
                        -- are just setting default looks o statusline
                        normal = { c = { fg = colors.fg, bg = colors.bg } },
                        inactive = { c = { fg = colors.fg, bg = colors.bg } },
                    },
                    globalstatus = true,
                },
                sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    -- These will be filled later
                    lualine_c = {},
                    lualine_x = {},
                },
                inactive_sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    lualine_c = {},
                    lualine_x = {},
                },
                extensions = { "neo-tree", "lazy" },
            }

            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
                table.insert(config.sections.lualine_c, component)
            end

            -- Inserts a component in lualine_x at right section
            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
            end

            ins_left({
                function()
                    return "▊"
                end,
                color = { fg = colors.blue }, -- Sets highlighting of component
                padding = { left = 0, right = 1 }, -- We don't need space before this
            })

            ins_left({
                -- mode component
                function()
                    return ""
                end,
                color = function()
                    -- auto change color according to neovims mode
                    local mode_color = {
                        n = colors.red,
                        i = colors.green,
                        v = colors.blue,
                        [""] = colors.blue,
                        V = colors.blue,
                        c = colors.magenta,
                        no = colors.red,
                        s = colors.orange,
                        S = colors.orange,
                        [""] = colors.orange,
                        ic = colors.yellow,
                        R = colors.violet,
                        Rv = colors.violet,
                        cv = colors.red,
                        ce = colors.red,
                        r = colors.cyan,
                        rm = colors.cyan,
                        ["r?"] = colors.cyan,
                        ["!"] = colors.red,
                        t = colors.red,
                    }
                    return { fg = mode_color[vim.fn.mode()] }
                end,
                padding = { right = 1 },
            })

            ins_left({
                -- filesize component
                "filesize",
                cond = conditions.buffer_not_empty,
            })

            ins_left({ "location" })

            ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

            ins_left({
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.cyan },
                },
                padding = { right = 8 },
            })

            -- Insert mid section. You can make any number of sections in neovim :)
            -- for lualine it's any number greater then 2
            ins_left({
                function()
                    return "%="
                end,
            })

            ins_left({
                -- Lsp server name .
                function()
                    local msg = "No Active Lsp"
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = " LSP:",
                color = { fg = "#ffffff", gui = "bold" },
            })

            -- Add components to right sections

            ins_right({
                "filename",
                cond = conditions.buffer_not_empty,
                color = { fg = colors.magenta, gui = "bold" },
            })

            ins_right({
                "o:encoding", -- option component same as &encoding in viml
                fmt = string.upper, -- I'm not sure why it's upper case either ;)
                cond = conditions.hide_in_width,
                color = { fg = colors.green, gui = "bold" },
            })

            ins_right({
                "fileformat",
                fmt = string.upper,
                icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
                color = { fg = colors.green, gui = "bold" },
            })

            ins_right({
                "branch",
                icon = "",
                color = { fg = colors.violet, gui = "bold" },
            })

            ins_right({
                "diff",
                -- Is it me or the symbol for modified us really weird
                symbols = { added = " ", modified = "󰝤 ", removed = " " },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
            })

            ins_right({
                function()
                    return "▊"
                end,
                color = { fg = colors.blue },
                padding = { left = 1 },
            })
            return config
        end,
    },
}
