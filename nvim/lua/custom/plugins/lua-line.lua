return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = { theme = 'catppuccin-mocha' },
    sections = {
      -- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md#available-components
      lualine_a = { 'mode' },
      lualine_b = { 'buffers' },
      lualine_c = {},
      lualine_x = { 'diff', 'diagnostics' },
      lualine_y = { 'location' },
      lualine_z = { 'mode' },
    },
  },
}
