return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- Neo-tree will lazily load itself
        keys = {
            {
                "\\", -- \ to toggle tree visibility
                function()
                    local winid = vim.fn.bufwinid("neo-tree filesystem [1]")
                    if winid == -1 or vim.api.nvim_get_current_win() ~= winid then
                        vim.cmd("Neotree reveal_force_cwd")
                    else
                        vim.cmd("Neotree close")
                    end
                end,
                desc = "Neotree toggle",
            },
        },
        opts = {
            filesystem = {
                filtered_items = { visible = true },
            },
            window = {
                mappings = {
                    ["<"] = function()
                        vim.cmd("cd ..")
                        vim.notify("cd .. → " .. vim.fn.getcwd(), vim.log.levels.INFO, { title = "Neo-tree" })
                    end,
                },
            },
        },
    },
}
