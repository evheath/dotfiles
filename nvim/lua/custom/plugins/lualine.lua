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
      lualine_x = { -- diplaying macro recording
        {
          function()
            local reg = vim.fn.reg_recording()
            if reg ~= '' then
              return 'Recording @' .. reg
            end
            return ''
          end,
        },
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
