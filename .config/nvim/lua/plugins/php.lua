return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
      })
      opts.parsers = opts.parsers or {}
      opts.parsers.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
        main_filetype = "php",
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        phpcs = {
          args = {
            "--standard=PSR12",
          },
        },
      },
    },
  },
}
