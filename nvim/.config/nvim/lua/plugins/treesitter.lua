return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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

            -- For jupyter
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = false, -- you can change this if you want.
                    goto_next_start = {
                        ["]b"] = { query = "@code_cell.inner", desc = "next code [B]lock" },
                    },
                    goto_previous_start = {
                        ["[b"] = { query = "@code_cell.inner", desc = "prev code [B]lock" },
                    },
                },
                select = {
                    enable = true,
                    lookahead = true, -- you can change this if you want
                    keymaps = {
                        ["ib"] = { query = "@code_cell.inner", desc = "[I]n [B]lock" },
                        ["ab"] = { query = "@code_cell.outer", desc = "[A]round [B]lock" },
                    },
                },
                swap = { -- Swap only works with code blocks that are under the same markdown header
                    enable = true,
                    swap_next = {
                        ["<leader>sbl"] = { query = "@code_cell.outer", desc = "[S]wap [B]lock next" },
                    },
                    swap_previous = {
                        ["<leader>sbh"] = { query = "@code_cell.outer", desc = "[S]wap [B]lock prev" },
                    },
                },
            },
        },
    },
}
