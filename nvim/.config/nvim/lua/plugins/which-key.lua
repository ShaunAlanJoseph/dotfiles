return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 300,
            spec = {
                { "<leader>s", group = "[S]earch" },
                { "<leader>t", group = "[T]oggle" },
            },
        },
    },
}
