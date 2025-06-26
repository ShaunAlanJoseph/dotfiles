return {
    {
        "nvimtools/hydra.nvim",
        config = function()
            local Hydra = require("hydra")

            Hydra({
                name = "Navigation",
                mode = "n",
                body = "<leader>",
                config = {
                    hint = { type = "window" },
                },
                heads = {
                    { "h", vim.cmd.bprev },
                    { "l", vim.cmd.bnext },
                    { "j", vim.cmd.tabnext },
                    { "k", vim.cmd.tabprev },
                },
            })

            local Layer = require("hydra.layer")

            Layer({
                enter = { { "n", "<leader>w", nil } },
                layer = {
                    { "n", "+", "<C-w>+" },
                    { "n", "-", "<C-w>-" },
                    { "n", ">", "<C-w>>" },
                    { "n", "<", "<C-w><" },
                    { "n", "=", "<C-w>=" },
                    { "n", "_", "<C-w>_" },
                    { "n", "h", "<C-w>h" },
                    { "n", "j", "<C-w>j" },
                    { "n", "k", "<C-w>k" },
                    { "n", "l", "<C-w>l" },
                },
                config = {
                    on_enter = function()
                        print("In window config mode . . .")
                    end,
                    on_exit = function()
                        print("Back to normal mode . . .")
                    end,
                },
            })
        end,
    },
}
