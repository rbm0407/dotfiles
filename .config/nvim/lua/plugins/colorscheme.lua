return {
  -- vertical column color, width set in config/options.lua
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, _)
        hl.ColorColumn = { bg = "#003522" }
      end,
    },
  },
}
