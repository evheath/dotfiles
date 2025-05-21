-- https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file#--bufferlinenvim
return {
  'akinsho/bufferline.nvim',
  -- version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  -- lazy = false,
  opts = {
    options = {
      separator_style = 'slant',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'snacks_layout_box',
        },
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
  end,
}
