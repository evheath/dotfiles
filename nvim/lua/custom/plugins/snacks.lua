-- https://github.com/folke/snacks.nvim/blob/main/docs/scratch.md
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    scratch = {
      ft = 'markdown',
    },
    explorer = {
      enabled = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = false, -- Don't auto-close when selecting files
          jump = { close = false }, -- Don't close when jumping to files
          layout = {
            preset = 'sidebar',
            layout = {
              width = 30,
              min_width = 20,
            },
          },
        },
      },
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
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
  },
}
