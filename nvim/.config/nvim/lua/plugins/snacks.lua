return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            input = { enabled = true },
            notifier = { enabled = true },
            zen = { enabled = true },
        },
    },
}
