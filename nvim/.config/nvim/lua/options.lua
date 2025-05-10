-- Visual
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.scrolloff = 5
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Case-insensitive searching unless \C or capital letters in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "a"

vim.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how certain whitespace characters will be displayed
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = ".", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Confirmation dialog
vim.opt.confirm = true

-- Uses 24-bit #rrggbb colors
vim.opt.termguicolors = true

vim.opt.updatetime = 250 -- Sets delay for certain events
vim.opt.timeoutlen = 300 -- Max time to wait for a key map
