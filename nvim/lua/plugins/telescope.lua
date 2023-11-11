return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup()
        local keymap = vim.keymap

        -- See `:help telescope.builtin`
        keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            { desc = '[?] Find recently opened files' })
        keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
        keymap.set(
            'n',
            '<leader>/',
            function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            { desc = '[/] Fuzzily search in current buffer]' }
        )

        keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]o to [D]efinitions' })
        keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]o to [R]eferences' })
        keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]o to [R]eferences' })
        keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = '[G]o to [I]mplementations' })
        keymap.set('n', '<leader>ds', require('telescope.builtin').document_symbols, { desc = 'Show [D]ocument [S]ymbols' })
        keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
}
