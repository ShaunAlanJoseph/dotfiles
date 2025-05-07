vim.api.nvim_set_hl(0, "CatppuccinMaroon", { fg = "#eba0ac" })
vim.api.nvim_set_hl(0, "CatppuccinPeach", { fg = "#fab387" })
vim.api.nvim_set_hl(0, "CatppuccinYellow", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "CatppuccinGreen", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "CatppuccinTeal", { fg = "#94e2d5" })
vim.api.nvim_set_hl(0, "CatppuccinSky", { fg = "#89dceb" })
vim.api.nvim_set_hl(0, "CatppuccinMaroonDark", { fg = "#5a4648" })
vim.api.nvim_set_hl(0, "CatppuccinPeachDark", { fg = "#5a4e44" })
vim.api.nvim_set_hl(0, "CatppuccinYellowDark", { fg = "#5a5640" })
vim.api.nvim_set_hl(0, "CatppuccinGreenDark", { fg = "#445647" })
vim.api.nvim_set_hl(0, "CatppuccinTealDark", { fg = "#425a55" })
vim.api.nvim_set_hl(0, "CatppuccinSkyDark", { fg = "#43575c" })

return {
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "CatppuccinMaroon",
                "CatppuccinPeach",
                "CatppuccinYellow",
                "CatppuccinGreen",
                "CatppuccinTeal",
                "CatppuccinSky",
            }

            local highlight_dark = {
                "CatppuccinMaroonDark",
                "CatppuccinPeachDark",
                "CatppuccinYellowDark",
                "CatppuccinGreenDark",
                "CatppuccinTealDark",
                "CatppuccinSkyDark",
            }

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup({ indent = { highlight = highlight_dark } })
        end,
    },
}
