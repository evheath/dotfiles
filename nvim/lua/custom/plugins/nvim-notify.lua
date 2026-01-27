return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy', -- or use "UIEnter" or similar to lazy-load
  config = function()
    require('notify').setup {
      background_colour = '#1E1E2E',
      merge_duplicates = true,
    }

    vim.keymap.set('n', '@', function()
      local reg = vim.fn.getcharstr()
      local count = vim.v.count1
      vim.cmd('normal! ' .. count .. '@' .. reg)
      local msg = count > 1
        and string.format('Played macro @%s %d times', reg, count)
        or string.format('Played macro @%s', reg)
      vim.notify(msg, vim.log.levels.INFO)
    end, { desc = 'Play macro with notification' })
  end,
}
