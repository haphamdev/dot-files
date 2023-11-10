return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    lazy = false,
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'gopls', 'intelephense' },
        }

        -- Diagnostic keymaps
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    end
}
