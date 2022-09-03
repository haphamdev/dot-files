local cmd, fn, g, opt, api = vim.cmd, vim.fn, vim.g, vim.opt, vim.api

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    use { 'ibhagwan/fzf-lua',
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons' -- optional for icons
        }
    }
    use 'lewis6991/gitsigns.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'airblade/vim-rooter'
    use 'christoomey/vim-tmux-navigator'
    use 'dag/vim-fish'
    use 'tpope/vim-surround'
    use 'christoomey/vim-system-copy'
    use 'mogelbrod/vim-jsonpath'
    use 'voldikss/vim-floaterm'
    use 'alvan/vim-closetag'
    use 'windwp/nvim-autopairs'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'vim-scripts/CSApprox'
    use 'Shougo/vimproc.vim'
    use 'hrsh7th/nvim-compe'
    use 'tomasiser/vim-code-dark'
    use 'famiu/bufdelete.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'b3nj5m1n/kommentary'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        'junegunn/fzf',
        run = function() vim.fn['fzf#install']() end
    }
    use 'kevinhwang91/nvim-bqf'
    use 'nacro90/numb.nvim'
    use 'djoshea/vim-autoread'
    use 'jwalton512/vim-blade'
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'fanliver/edgedb-vim', branch = 'support-nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use({
        "NTBBloodbath/galaxyline.nvim",
        -- your statusline
        config = function()
            require("galaxyline.themes.eviline")
        end,
        -- some optional icons
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })
    use 'shiftwinting/floating.nvim'
    use 'axieax/urlview.nvim'
    use {
        "sitiom/nvim-numbertoggle",
        config = function()
            require("numbertoggle").setup()
        end
    }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                -- your configuration
                saga_winblend = 30,
                finder_action_keys = {
                    open = "<CR>",
                    vsplit = "s",
                    split = "i",
                    tabe = "t",
                    quit = "q",
                    scroll_down = "<C-f>",
                    scroll_up = "<C-b>", -- quit can be a table
                },
            })
        end,
    })
end)

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            -- ["foo.bar"] = "Identifier",
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}

g.rooter_patterns = { '.git', 'Makefile', '*.sln', 'build/env.sh', 'package.json', 'build.gradle', 'build.gradle.kts' }

-- Optionally copy path to a named register (* in this case) when calling :JsonPath
g.jsonpath_register = '*'

-- Floaterm config (voldikss/vim-floaterm)
g.floaterm_autoclose = 1
g.floaterm_winblend = 0
g.floaterm_width = 0.8
g.floaterm_height = 0.8

-- alvan/vim-closetag
-- These are the file extensions where this plugin is enabled.
g.closetag_filenames = '*.html,*.xhtml,*.phtml'
-- filenames like *.xml, *.xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.
g.closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.
g.closetag_filetypes = 'html,xhtml,phtml,typescriptreact,xml'
-- filetypes like xml, xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.
g.closetag_xhtml_filetypes = 'xhtml,jsx,tsx,typescriptreact'
-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
g.closetag_emptyTags_caseSensitive = 1
-- dict
-- Disables auto-close if not in a "valid" region (based on filetype)
g.closetag_regions = {
    ["typescript.tsx"] = 'jsxRegion,tsxRegion',
    ["javascript.jsx"] = 'jsxRegion',
    typescriptreact = 'jsxRegion,tsxRegion',
    javascriptreact = 'jsxRegion',
}
-- Shortcut for closing tags, default is '>'
g.closetag_shortcut = '>'
-- Add > at current position without closing the current tag, default is ''
g.closetag_close_shortcut = '<leader>>'

-- Change colorscheme to codedark
cmd('silent! colorscheme codedark')

-- compe
require 'compe'.setup({
    enabled = true,
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
    },
})

-- nvim-tree.lua
local tree_cb = require 'nvim-tree.config'.nvim_tree_callback
require 'nvim-tree'.setup {
    view = {
        mappings = {
            list = {
                { key = { "<CR>", "l" }, cb = tree_cb("edit") },
                { key = { "<BS>", "h" }, cb = tree_cb("close_node") },
            }
        }
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
}

-- kommentary
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

-- todo-comment
require("todo-comments").setup()

-- numb
require('numb').setup()

require('fzf-lua').setup {
    grep = {
        glob_flag      = "--iglob", -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-" -- query separator pattern (lua): ' --'
    },
    winopts = {
        preview = {
            default = 'bat'
        }
    }
}

-- bufferline
require("bufferline").setup {}

-- load the config for diffview.nvim. Please check ./diffview-plugin.lua for more details
require('diffview-plugin')

-- setup nvim-autopairs
require('nvim-autopairs').setup {}

-- setup for gitsigns.nvim
require('gitsigns').setup {
    numhl              = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl             = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff          = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = true,
}

--setup for lukas-reineke/indent-blankline.nvim
require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
}

-- setup for norcalli/nvim-colorizer.lua
require 'colorizer'.setup()
