return {
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {
      router = {
        browse = {
          ["^gitlab%.personio%-internal%.de"] = "https://gitlab.personio-internal.de/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blob/"
            .. "{_A.REV}/"
            .. "{_A.FILE}"
            .. "#L{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
        },
        blame = {
          ["^gitlab%.personio%-internal%.de"] = "https://gitlab.personio-internal.de/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blame/"
            .. "{_A.REV}/"
            .. "{_A.FILE}"
            .. "#L{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
        },
        default_branch = {
          ["^gitlab%.personio%-internal%.de"] = "https://gitlab.personio-internal.de/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blob/"
            .. "{_A.DEFAULT_BRANCH}/"
            .. "{_A.FILE}"
            .. "#L{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
        },
        current_branch = {
          ["^gitlab%.personio%-internal%.de"] = "https://gitlab.personio-internal.de/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blob/"
            .. "{_A.CURRENT_BRANCH}/"
            .. "{_A.FILE}"
            .. "#L{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
        },
      },
    },
    keys = {
      { "<leader>gy", "<cmd>GitLink current_branch<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink! current_branch<cr>", mode = { "n", "v" }, desc = "Open git link" },
      {
        "<leader>gm",
        "<cmd>GitLink default_branch<cr>",
        mode = { "n", "v" },
        desc = "Yank git link on master branch",
      },
      {
        "<leader>gM",
        "<cmd>GitLink! default_branch<cr>",
        mode = { "n", "v" },
        desc = "Open git link on master branch",
      },
    },
  },
}
