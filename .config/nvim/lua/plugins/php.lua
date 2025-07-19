return {
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
