-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function RUN_CARGO_BUILD()
    local filename = vim.fn.expand("%:t")
    local file_extension = vim.fn.expand("%:e")
    local cargo_toml_exists = vim.fn.glob("Cargo.toml")

    if file_extension == "rs" or cargo_toml_exists ~= "" then
        local output = vim.fn.system("cargo lbuild --message-format short 2>&1")

        local result_lines = {}
        local found_compiling = false

        -- Split the output into lines
        local lines = vim.split(output, "\n")

        -- Process the lines to capture desired output
        for i, line in ipairs(lines) do
            if i == 1 and string.find(line, "Compiling") then
                found_compiling = true
                table.insert(result_lines, line)
            elseif i == 1 and string.find(line, "Finished") then
                table.insert(result_lines, line)
            elseif found_compiling and #result_lines == 1 then
                table.insert(result_lines, line)
                break
            end
        end

        -- Display captured lines in Vim
        for _, line in ipairs(result_lines) do
            vim.cmd('echom "' .. line:gsub('"', '\\"') .. '"')
        end
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
