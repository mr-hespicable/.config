-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function RUN_CARGO_BUILD()
    local filename = vim.fn.expand("%:t")
    local file_extension = vim.fn.expand("%:e")
    local cargo_toml_exists = vim.fn.glob("Cargo.toml")

    if file_extension == "rs" or cargo_toml_exists ~= "" then
        local output = vim.fn.system("cargo lbuild --message-format short")
        vim.cmd("redraw")
        print(output)
    else
        print("Not a Rust project or file.")
    end
end

-- Keymap to run the function
vim.api.nvim_set_keymap(
    "n", -- Mode (normal mode)
    "<leader>cb", -- Key sequence
    ":lua RUN_CARGO_BUILD()<CR>", -- Command
    { noremap = true, silent = true } -- Options
)
