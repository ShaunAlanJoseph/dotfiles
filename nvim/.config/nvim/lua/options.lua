-- Visual
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.scrolloff = 5
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.wrap = false

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

-- Case-insensitive searching unless \C or capital letters in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.mouse = "a"

vim.undofile = true

vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how certain whitespace characters will be displayed
vim.o.list = true
vim.o.listchars = "tab:» ,trail:.,nbsp:␣"

-- Preview substitutions live
vim.o.inccommand = "split"

-- Confirmation dialog
vim.o.confirm = true

-- Uses 24-bit #rrggbb colors
vim.o.termguicolors = true

vim.o.updatetime = 250 -- Sets delay for certain events
vim.o.timeoutlen = 300 -- Max time to wait for a key map
