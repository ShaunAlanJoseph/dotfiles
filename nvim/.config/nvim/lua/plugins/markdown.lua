return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        ft = "markdown",
        opts = {
            render_modes = true,
            code = {
                -- border = "thick",
            },
            completions = { blink = { enabled = true } },
        },
    },
}
