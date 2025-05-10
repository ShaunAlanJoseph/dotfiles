local default_notebook = [[{
    "cells": [
        {
            "cell_type": "markdown",
            "metadata": {},
            "source": [
                ""
            ]
        }
    ],
    "metadata": {
        "kernelspec": {
            "display_name": "Python 3",
            "language": "python",
            "name": "python3"
        },
        "language_info": {
            "codemirror_mode": {
                "name": "ipython"
            },
            "file_extension": ".py",
            "mimetype": "text/x-python",
            "name": "python",
            "nbconvert_exporter": "python",
            "pygments_lexer": "ipython3"
        }
    },
    "nbformat": 4,
    "nbformat_minor": 5
}]]

local function new_notebook(filename)
    local path = filename .. ".ipynb"
    local file = io.open(path, "w")
    if file then
        file:write(default_notebook)
        file:close()
        vim.cmd("edit " .. path)
        vim.cmd("normal G")
    else
        print("Error: Could not open new notebook file for writing.")
    end
end

vim.api.nvim_create_user_command("NewNotebook", function(opts)
    new_notebook(opts.args)
end, {
    nargs = 1,
    complete = "file",
})

vim.g.python3_host_prog = vim.fn.expand("~/.venv/neovim/bin/python3")

return {
    {
        "3rd/image.nvim",
        build = false, -- so that it doesn't build the rock
        opts = {
            processor = "magick_cli",
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge, -- necessary for good experience
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
        },
    },
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.molten_auto_open_output = false
            vim.g.molten_virt_text_output = true
            vim.g.molten_wrap_output = true -- For virtual text
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20

            vim.keymap.set("n", "<leader>ri", function()
                local venv = os.getenv("VIRTUAL_ENV")
                if venv ~= nil then
                    venv = string.match(venv, "/.+/(.+)")
                    vim.cmd(("MoltenInit %s"):format(venv))
                else
                    vim.cmd("MoltenInit")
                end
            end, { desc = "desc = Molten [I]nit", silent = true })

            vim.keymap.set("n", "<leader>re", ":MoltenEvaluateOperator<CR>", { desc = "[E]valuate Operator" })

            vim.keymap.set("n", "<leader>ro", function()
                if vim.bo.filetype ~= "molten_output" then
                    vim.cmd("noautocmd MoltenEnterOutput")
                else
                    vim.cmd("MoltenHideOutput")
                end
            end, { desc = "Toggle [O]utput", silent = true })

            vim.keymap.set(
                "n",
                "<leader>rr",
                ":MoltenReevaluateCell<CR>",
                { desc = "[R]e-evaluate Cell", silent = true }
            )

            vim.keymap.set({ "n", "i" }, "<C-b>", "<Esc>i```py<CR>```<Esc>O", { desc = "Insert [B]lock" })
        end,
    },
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "quarto", "markdown" },
        config = function()
            require("quarto").setup({
                lspFeatures = {
                    languages = { "python" },
                    chunks = "all",
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = { enabled = true },
                },
                codeRunner = {
                    enabled = true,
                    default_method = "molten",
                },
            })

            local runner = require("quarto.runner")

            vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "[R]un [C]ell" })
            vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "[R]un [A]bove" })
            vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "[R]un [A]ll" })
            vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "[R]un [L]ine" })
            vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "[R]un Range" })
        end,
    },
    {
        "GfBallesteros/jupytext.nvim",
        lazy = false,
        config = function()
            require("jupytext").setup({
                style = "markdown",
                output_extension = "md",
                force_ft = "markdown",
            })

            vim.api.nvim_create_autocmd("BufWriteCmd", {
                group = vim.api.nvim_create_augroup("format-on-save-ipbny", { clear = true }),
                pattern = "*.ipynb",
                desc = "Format files when they are saved",
                callback = function(args)
                    print("Formatting . . . " .. vim.api.nvim_buf_get_name(args.buf))
                    vim.lsp.buf.format({ async = false, bufnr = args.buf })
                end,
            })
        end,
    },
}
