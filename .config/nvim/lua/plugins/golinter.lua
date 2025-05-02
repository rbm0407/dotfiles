return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "revive",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    opts = {
      linters_by_ft = {
        go = { "revive" },
      },
    },
  },
}
