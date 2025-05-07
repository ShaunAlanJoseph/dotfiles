-- [[ Bootstrap lazy.nvim ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]
require("lazy").setup({
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

    require("plugins/gitsigns"), -- Adds git related signs to the gutter

    require("plugins/which-key"), -- Shows pending keybinds

    require("plugins/telescope"), -- Fuzzy Finder

    require("plugins/lspconfig"), -- Language Server Protocol

    require("plugins/blink-cmp"), -- Autocompletion && Snippets

    require("plugins/theme"),

    require("plugins/todo-comments"),

    require("plugins/mini"), -- Collection of useful plugins

    require("plugins/snacks"), -- Collection of QoL plugins

    require("plugins/lualine"), -- Statusline

    require("plugins/treesitter"), -- Better highlighting

    require("plugins/autopairs"),

    require("plugins/indent-line"),

    require("plugins/neo-tree"), -- File tree

    require("plugins/none-ls"), -- Linter

    require("plugins/winsep"),
})
