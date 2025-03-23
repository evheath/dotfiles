return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['<esc><esc>'] = { 'actions.close', mode = 'n' },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
}
