return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load it before all other plugins
        config = function()
            require("catppuccin").setup({
                transparent_background = false,
            })
            vim.cmd("colorscheme catppuccin")
        end,
    },
}
