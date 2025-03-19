return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = { theme = 'catppuccin-mocha' },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'buffers' },
      lualine_c = { 'diagnostics' },
      lualine_x = { 'filetype' },
      lualine_y = { 'location' },
      lualine_z = { 'mode' },
    },
  },
}
