-- https://github.com/catppuccin/nvim
return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        treesitter = true,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        which_key = true,
      },
      transparent_background = true,
    }
    vim.cmd 'colorscheme catppuccin-mocha'
  end,
}
