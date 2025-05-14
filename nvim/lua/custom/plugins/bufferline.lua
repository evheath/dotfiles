-- https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file#--bufferlinenvim
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      always_show_bufferline = true,
    },
  },
}
