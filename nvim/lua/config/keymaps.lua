-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local options = { remap = false }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "jj", "<Esc>", { silent = true, desc = "Exit Insert mode" })

map({ "v", "n", "o" }, "H", "^", { silent = true, desc = "Move to beginning of line" })
map({ "v", "n", "o" }, "L", "$", { silent = true, desc = "Move to end of line" })

-- <leader> v/h for vertical/horizontal split
map("n", "<leader>v", ":<C-u>split<CR>")
map("n", "<leader>h", ":<C-u>vsplit<CR>")

-- Ctrl U in insert mode to switch text case of the current word
map("i", "<C-u>", "<esc>mqg~iw`qa")

-- <leader>fp to copy the path of current file to clipboard
map("n", "<leader>fp", [[:let @* = expand('%')<CR>]])

-- x to delete a character without saving it in the " register
map("n", "x", '"_x', { silent = true })

map("n", "<leader>rl", [[:luafile $MYVIMRC<CR>]])

-- Disable arrow keys
map("n", "<up>", "<NOP>")
map("n", "<down>", "<NOP>")
map("n", "<left>", "<NOP>")
map("n", "<right>", "<NOP>")
map("i", "<up>", "<NOP>")
map("i", "<down>", "<NOP>")
map("i", "<left>", "<NOP>")
map("i", "<right>", "<NOP>")

-- smart-splits.nvim
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
map("n", "<A-h>", require("smart-splits").resize_left)
map("n", "<A-j>", require("smart-splits").resize_down)
map("n", "<A-k>", require("smart-splits").resize_up)
map("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
map("n", "<C-h>", require("smart-splits").move_cursor_left)
map("n", "<C-j>", require("smart-splits").move_cursor_down)
map("n", "<C-k>", require("smart-splits").move_cursor_up)
map("n", "<C-l>", require("smart-splits").move_cursor_right)
map("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
map("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
map("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
map("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
map("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
