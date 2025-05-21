-- https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file#--bufferlinenvim
return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      separator_style = 'slope',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'snacks_layout_box',
        },
      },
    },
  },
  config = function(_, opts)
    local bufferline = require 'bufferline'
    local catppuccin_ok, catppuccin = pcall(require, 'catppuccin.groups.integrations.bufferline')
    if catppuccin_ok then
      opts.highlights = catppuccin.get()
    end
    bufferline.setup(opts)
  end,
}
