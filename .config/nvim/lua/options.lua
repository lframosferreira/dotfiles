-- number
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true

vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in search, assumes case-sensitive search

-- lines
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
