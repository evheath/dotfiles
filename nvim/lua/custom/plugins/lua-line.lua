return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = { theme = 'catppuccin-mocha' },
    sections = {
      -- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md#available-components
      lualine_a = { 'mode' },
      lualine_b = { { 'buffers', use_mode_colors = true } },
      lualine_c = {},
      lualine_x = { 'diff', 'diagnostics', { 'filename', path = 1 } },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
