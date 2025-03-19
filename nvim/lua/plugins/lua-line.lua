return {
  'nvim-lualine/lualine.nvim',
  -- enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- options = { theme = 'gruvbox_light' },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
