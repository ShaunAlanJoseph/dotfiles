return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        -- local code_actions = null_ls.builtins.code_actions
        -- local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        -- local hover = null_ls.builtins.hover
        -- local completion = null_ls.builtins.completion

        local sources = {
            formatting.stylua,
        }

        null_ls.setup({ sources = sources })
    end,
}
