vim.cmd [[
  augroup ColorizerAutoAttach
    autocmd!
    autocmd BufReadPost,BufNewFile * lua require'colorizer'.attach_to_buffer()
  augroup END
]]
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      filetypes = { '*' },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      },
    }
  end,
}
