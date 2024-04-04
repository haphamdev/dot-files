return {
    "windwp/nvim-ts-autotag",
    ft = { "php", "typescript", "html", "xml", "markdown", "jsx", "tsx", "javascript", "typescriptreact" },
    config = function()
        require 'nvim-treesitter.configs'.setup {
            autotag = {
                enable = true,
            }
        }
    end,
}
