return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")

      lspconfig.tailwindcss.setup({
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "templ", "html", "css", "scss", "javascript", "typescript" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", ".git")(fname)
        end,
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      })
    end,
  },
}
