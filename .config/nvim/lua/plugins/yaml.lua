return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "yamlls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
        disable = { "yaml" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              validate = true,
              hover = true,
              completion = true,
              schemas = {
                ["kubernetes"] = "0*.yml",
              },
            },
          },
        },
      },
    },
  },
}
