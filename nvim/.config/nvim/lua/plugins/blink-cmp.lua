return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "1.*",
        dependencies = {
            -- Snippet Engine
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" }, -- Provides snippets from different programming languages
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            "folke/lazydev.nvim",
        },
        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {
            keymap = { preset = "super-tab" },
            appearance = { nerd_font_variant = "mono" },
            completion = { documentation = { auto_show = false } },
            signature = { enabled = true },
            snippets = { preset = "luasnip" },
            fuzzy = { implementation = "prefer_rust_with_warning" }, -- Faster fuzzy

            sources = {
                default = { "lsp", "path", "snippets", "lazydev", "buffer" },
                providers = {
                    -- Defining lazydev as a provider
                    lazydev = { module = "lazydev.integrations.blink", score_offset = 100 }, -- Boosting it's score by 100
                },
            },
        },
    },
}
