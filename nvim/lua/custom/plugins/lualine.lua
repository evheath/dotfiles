-- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = { theme = 'catppuccin-mocha' },
    sections = {
      -- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md#available-components
      lualine_a = { 'mode' },
      lualine_b = { { 'filename', path = 1 } },
      lualine_c = { 'diagnostics' },
      lualine_x = { 'diff' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
