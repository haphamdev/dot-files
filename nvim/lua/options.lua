local cmd, fn, g, opt, api = vim.cmd, vim.fn, vim.g, vim.opt, vim.api

-- Set minimum number of screen lines before/after the cursor
opt.scrolloff = 6

-- Round indent to multiple of shiftwidth
opt.shiftround = true

-- Window title
opt.title = true
opt.titleold = "Terminal"
opt.titlestring = "%F"

-- More lines for typing commands
opt.cmdheight = 2

-- Treesitter folding config
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- opt.foldlevel = 6

-- Set color column to mark the line limit
opt.colorcolumn = "120"

-- Enable mouse for normal and insert mode
opt.mouse = "ni"

-- Show whitespace characters
opt.list = true
opt.listchars:append "space:⋅"
