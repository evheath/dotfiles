-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 0,
    icons = {
      mappings = false,
    },
    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[c]ode', mode = { 'n', 'x' } },
      { '<leader>s', group = '[s]earch help' },
      { '<leader>t', group = '[t]oggle' },
      { '<leader>g', group = '[g]it', mode = { 'n', 'v' } },
      { '<leader>p', group = '[p]eek', mode = { 'n', 'i' } },
    },
  },
}
