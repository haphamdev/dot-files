return {
    { 'lewis6991/gitsigns.nvim', lazy = false, config = function() require('gitsigns').setup() end },
    { 'windwp/nvim-autopairs', event = "InsertEnter", opts = {} },
    { 'NvChad/nvim-colorizer.lua', opts = {}, lazy = false },
    { 'djoshea/vim-autoread', opts = {}, lazy = false, config = function() end },
    { 'axieax/urlview.nvim', opts = {}, lazy = false },
    { 'sitiom/nvim-numbertoggle', lazy = false },
    { 'pocco81/auto-save.nvim', lazy = false },
    { 'christoomey/vim-system-copy', lazy = false },
}
