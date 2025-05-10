-- [[ Keymaps ]]

vim.keymap.set("i", "kj", "<Esc>", { desc = "Goto normal mode" })

-- Clear highlights on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Use Ctrl + hjkl to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use Space + hl to cycle between buffers
vim.keymap.set("n", "<leader>h", vim.cmd.bprev, { desc = "Go to the prev buffer" })
vim.keymap.set("n", "<leader>l", vim.cmd.bnext, { desc = "Go to the next buffer" })

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat buffer" })

-- Toggle zen
vim.keymap.set("n", "<leader>tz", require("snacks").zen.zen, { desc = "[T]oggle [Z]en" })

-- Freeing up keymaps
vim.keymap.set("n", "S", "<Nop>", {})

-- Clipboard
vim.keymap.set({ "n", "v", "i" }, "<A-y>", function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    vim.fn.setreg("+", table.concat(lines, "\n"))
    vim.notify(
        "Copied buffer to clipboard:\n" .. vim.fs.basename(vim.api.nvim_buf_get_name(0)),
        vim.log.levels.INFO,
        { title = "Clipboard" }
    )
end, { desc = "Copy buffer to clipboard" })

vim.keymap.set({ "n", "v", "i" }, "<A-f>", function()
    local path = vim.api.nvim_buf_get_name(0)
    vim.fn.setreg("+", path)
    vim.notify("Copied path to clipboard:\n" .. vim.fs.basename(path), vim.log.levels.INFO, { title = "Clipboard" })
end, { desc = "Copy path to clipboard" })

-- [[ Autocommands ]]

local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-- Highlight when yanking
create_autocmd("TextYankPost", {
    desc = "Highlight when yanking",
    group = create_augroup("yank-highlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Resize splits when window size changes
create_autocmd("VimResized", {
    group = create_augroup("resize-splits", { clear = true }),
    desc = "Resize splits when window size changes",
    command = "tabdo wincmd =",
})

-- Autoformat on save
create_autocmd("BufWritePre", {
    group = create_augroup("format-on-save", { clear = true }),
    desc = "Format files when they are saved",
    callback = function(args)
        vim.lsp.buf.format({ async = false, bufnr = args.buf })
    end,
})
