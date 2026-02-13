return {
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    opts = {
      interactions = {
        chat = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:480b-cloud",
          },
        },
        inline = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:480b-cloud",
          },
        },
        cmd = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:480b-cloud",
          },
        },
        background = {
          adapter = {
            name = "ollama",
            model = "qwen3-coder:480b-cloud",
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
