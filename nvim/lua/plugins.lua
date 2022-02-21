local cmd, fn, g, opt, api = vim.cmd, vim.fn, vim.g, vim.opt, vim.api

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
    use { 'ibhagwan/fzf-lua',
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons' -- optional for icons
        }
    }
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'airblade/vim-gitgutter'
    use 'Yggdroot/indentLine'
    use 'airblade/vim-rooter'
    use 'christoomey/vim-tmux-navigator'
    use 'dag/vim-fish'
    use 'tpope/vim-surround'
    use 'christoomey/vim-system-copy'
    use 'mogelbrod/vim-jsonpath'
    use 'voldikss/vim-floaterm'
    use 'alvan/vim-closetag'
    use 'jiangmiao/auto-pairs'
    use 'gko/vim-coloresque'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'vim-scripts/CSApprox'
    use 'Shougo/vimproc.vim'
    use 'hrsh7th/nvim-compe'
    use 'tomasiser/vim-code-dark'
    use 'famiu/bufdelete.nvim'
    use 'xiyaowong/nvim-cursorword'
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
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
end)

require'nvim-treesitter.configs'.setup {
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
  }
}

-- Vim airline
cmd([[
    let g:airline_theme = 'powerlineish'
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline_skip_empty_sections = 1


    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    if !exists('g:airline_powerline_fonts')
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'
      let g:airline_left_sep          = '▶'
      let g:airline_left_alt_sep      = '»'
      let g:airline_right_sep         = '◀'
      let g:airline_right_alt_sep     = '«'
      let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
      let g:airline#extensions#readonly#symbol   = '⊘'
      let g:airline#extensions#linecolumn#prefix = '¶'
      let g:airline#extensions#paste#symbol      = 'ρ'
      let g:airline_symbols.linenr    = '␊'
      let g:airline_symbols.branch    = '⎇'
      let g:airline_symbols.paste     = 'ρ'
      let g:airline_symbols.paste     = 'Þ'
      let g:airline_symbols.paste     = '∥'
      let g:airline_symbols.whitespace = 'Ξ'
    else
      let g:airline#extensions#tabline#left_sep = ''
      let g:airline#extensions#tabline#left_alt_sep = ''

      " powerline symbols
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_symbols.branch = ''
      let g:airline_symbols.readonly = ''
      let g:airline_symbols.linenr = ''
    endif
]])

-- indentLine
g.indentLine_enabled = 1
g.indentLine_concealcursor = 0
g.indentLine_char = '┆'
g.indentLine_faster = 1

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
require'compe'.setup({
    enabled = true,
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
    },
})

-- nvim-tree.lua
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
    view = {
        mappings = {
            list = {
                { key = {"<CR>", "l" },       cb = tree_cb("edit") },
                { key = { "<BS>", "h" },      cb = tree_cb("close_node") },
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
        glob_flag           = "--iglob",  -- for case sensitive globs use '--glob'
        glob_separator      = "%s%-%-"    -- query separator pattern (lua): ' --'
    }
}

require("bufferline").setup{}
