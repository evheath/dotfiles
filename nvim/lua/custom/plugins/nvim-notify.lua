return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy', -- or use "UIEnter" or similar to lazy-load
  config = function()
    require('notify').setup {
      background_colour = '#1E1E2E',
      merge_duplicates = true,
    }
  end,
}
