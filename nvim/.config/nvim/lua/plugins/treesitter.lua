return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "vim",
                "vimdoc",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
