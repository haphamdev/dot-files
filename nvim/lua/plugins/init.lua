return {
    { 'lewis6991/gitsigns.nvim', event = { 'BufReadPre', 'BufNewFile' }, opts = {} },
    { 'windwp/nvim-autopairs', event = "InsertEnter", opts = {} },
    { 'NvChad/nvim-colorizer.lua', opts = {}, event = { 'BufEnter', 'BufWrite' } },
    { 'djoshea/vim-autoread', opts = {}, event = { 'BufEnter', 'BufWrite' }, config = function() end },
    { 'axieax/urlview.nvim', opts = {}, event = 'BufEnter' },
    { 'sitiom/nvim-numbertoggle', event = 'BufEnter' },
    { 'pocco81/auto-save.nvim', event = { 'BufReadPre', 'BufNewFile' } },
    { 'christoomey/vim-system-copy', event = 'BufEnter' },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, event = { 'BufReadPre', 'BufNewFile' } },
    { "terrastruct/d2-vim", ft = 'd2'}
}
