local cmd, fn, g, opt, api = vim.cmd, vim.fn, vim.g, vim.opt, vim.api

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- jj to escape insert mode
map('i', 'jj', '<esc>', { silent = true })

-- <leader><space> to toggle search highlights
map('n', '<leader><space>', ':noh<CR>', { silent = true })

-- H and L instead of ^ and $
map('', 'H', '^')
map('', 'L', '$')

-- Disable arrow keys
map('n', '<up>', '<NOP>')
map('n', '<down>', '<NOP>')
map('n', '<left>', '<NOP>')
map('n', '<right>', '<NOP>')
map('i', '<up>', '<NOP>')
map('i', '<down>', '<NOP>')
map('i', '<left>', '<NOP>')
map('i', '<right>', '<NOP>')

-- Ctrl U in insert mode to switch text case of the current word
map('i', '<C-u>', '<esc>mqg~iw`qa')

-- <leader> v/h for vertical/horizontal split
map('', '<leader>v', ':<C-u>split<CR>')
map('', '<leader>s', ':<C-u>vsplit<CR>')

-- <leader>fp to copy the path of current file to clipboard
map('n', '<leader>fp', [[:let @* = expand('%')<CR>]])

-- Buffer navigation
map('n', '<leader>w', ':bdelete<CR>') -- Close buffer

-- Keep in visual mode after indentation
map('v', '<', '<gv')
map('v', '>', '>gv')

-- J/K to move visual block up/down
map('v', 'J', [[:m '>+1<CR>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])

map('n', '<leader>rl', [[:luafile $MYVIMRC<CR>]])

-- Browse current line in GitHub repo
map('n', '<leader>o', [[:GBrowse<CR>]])

--nvim-tree.lua
map('n', '<leader>xx', [[:NvimTreeToggle<CR>]], { silent = true })
map('n', '<leader>xf', [[:NvimTreeFindFile<CR>]], { silent = true })

--bufferline.nvim
map('n', '<C-w>l', [[:BufferLineCloseRight<CR>]], { silent = false })
map('n', '<C-w>h', [[:BufferLineCloseLeft<CR>]], { silent = false })
map('n', '<C-w>o', [[:BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>]], { silent = false })
map('n', 'gb', [[:BufferLinePick<CR>]], { silent = true })

--diffview.nvim
map('n', '<C-g>d', [[:DiffviewOpen<CR>]])
map('n', '<C-g>c', [[:DiffviewClose<CR>]])
map('n', '<C-g>h', [[:DiffviewFileHistory .<CR>]])
map('n', '<C-g>l', [[:DiffviewFileHistory<CR>]])

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
