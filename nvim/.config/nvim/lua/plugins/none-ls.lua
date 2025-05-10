return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local helpers = require("null-ls.helpers")

        -- local code_actions = null_ls.builtins.code_actions
        -- local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        -- local hover = null_ls.builtins.hover
        -- local completion = null_ls.builtins.completion

        local sources = {
            formatting.stylua,
            formatting.prettierd.with({ -- Only .ipynb markdown files
                filetypes = { "markdown" },
                runtime_condition = function(params)
                    return params.bufname:match("%.ipynb$")
                end,

                -- Pass the text via stdin so that filepath (with .ipynb) isn't sent
                generator_opts = {
                    command = "prettierd",
                    to_stdin = true,
                    args = function(params) -- Pass a fake filepath to trigger markdown formatting
                        local fake_md = params.bufname:gsub("%.ipynb$", ".md")
                        return { "--stdin-filepath", fake_md }
                    end,
                },
            }),
            formatting.prettierd, -- Other file supported by prettier

            helpers.make_builtin({ -- Formatting code blocks
                name = "blacken_docs",
                method = null_ls.methods.FORMATTING,
                filetypes = { "markdown" },
                generator_opts = {
                    command = vim.fn.expand("~/.venv/neovim/bin/blacken-docs"),
                    args = { "$FILENAME" },
                    to_temp_file = true,
                    from_temp_file = true,
                },
                factory = helpers.formatter_factory,
            }),
        }

        null_ls.setup({
            sources = sources,
            debug = true,
        })
    end,
}
