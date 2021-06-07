local cmd, fn, g, opt, api = vim.cmd, vim.fn, vim.g, vim.opt, vim.api

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to comma
map('n', ',', '<NOP>', { silent = true })
g.mapleader = ","

-- jj to escape insert mode
map('i', 'jj', '<esc>', { silent = true })

-- <leader><space> to toggle search highlights
map('n', '<leader><space>', ':noh<CR>', { silent = true })

-- H and L instead of ^ and $
map('', 'H', '^')
map('',  'L', '$')

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
map('', '<leader>h', ':<C-u>split<CR>')
map('', '<leader>v', ':<C-u>vsplit<CR>')

-- <leader>fp to copy the path of current file to clipboard
map('n', '<leader>fp', [[:let @* = expand('%')<CR>]])

-- Buffer navigation
map('n', '<leader>q', ':bp<CR>')
map('n', '<leader>w', ':bn<CR>')
map('n', '<leader>c', ':bd<CR>') -- Close buffer

-- Keep in visual mode after indentation
map('v', '<', '<gv')
map('v', '>', '>gv')

-- J/K to move visual block up/down
map('v', 'J', [[:m '>+1<CR>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])

map('n', '<leader>rl', [[:luafile $MYVIMRC<CR>]])

-- Floaterm (voldikss/vim-floaterm)
map('n', '<leader>tn', ':FloatermNew<CR>')
map('n', '<leader>tt', ':FloatermToggle!<CR>')
map('t', '<leader>tn', [[<C-\><C-n>:FloatermNew<CR>]])
map('t', '<leader>tl', [[<C-\><C-n>:FloatermNext<CR>]])
map('t', '<leader>th', [[<C-\><C-n>:FloatermPrev<CR>]])
map('t', '<leader>tt', [[<C-\><C-n>:FloatermToggle!<CR>]])
map('t', '<leader>tb', [[<C-\><C-n>]])

-- fzf-lua
local getFzfFunction = function (functionName)
    return [[<cmd>lua require('fzf-lua').]] .. functionName .. [[()<CR>]]
end

-- " Find files using Telescope command-line sugar.
map('n', '<leader>e', getFzfFunction('files'))
map('n', '<leader>fa', getFzfFunction('live_grep'))
map('n', '<leader>b', getFzfFunction('buffers'))
map('n', '<leader>fh', getFzfFunction('help_tags'))
map('n', '<leader>fw', getFzfFunction('grep_cword'))
map('n', '<leader>rf', getFzfFunction('oldfiles'))
map('n', '<leader>ff', getFzfFunction('grep_curbuf'))
map('n', 'gd', getFzfFunction('lsp_definitions'))
map('n', 'gi', getFzfFunction('lsp_implementations'))
map('n', 'gr', getFzfFunction('lsp_references'))
map('n', '<space>ca', getFzfFunction('lsp_code_actions'))
map('n', '<space>s', getFzfFunction('lsp_document_symbols'))

-- Browse current line in GitHub repo
map('n', '<leader>o', [[:GBrowse<CR>]])

-- CHADtree
map('n', '<leader>ch', [[:CHADopen<CR>]])

--nvim-compe
map('i', '<C-Space>', [[compe#complete()]], { expr = true; silent = true })
map('i', '<CR>', [[compe#confirm('<CR>')]], { expr = true; silent = true })
map('i', '<C-e>', [[compe#close('<C-e>')]], { expr = true; silent = true })
