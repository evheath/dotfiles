-- https://github.com/folke/snacks.nvim/blob/main/docs/scratch.md
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scratch = {
      ft = 'markdown',
    },
  },
  keys = {
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'scratch',
    },
  },
}
