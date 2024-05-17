-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "asm",
      "bash",
      "c",
      "cmake",
      "css",
      "csv",
      "dart",
      "diff",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "go",
      "groovy",
      "helm",
      "html",
      "java",
      "javascript",
      "jq",
      "json",
      "kotlin",
      "make",
      "markdown_inline",
      "php",
      "proto",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "terraform",
      "tmux",
      "toml",
      "typescript",
      "xml",
      "yaml",
    })
  end,
}