-- https://github.com/stevearc/oil.nvim?tab=readme-ov-file#options
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
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    preview = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = 0.9,
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- Whether the preview window is automatically updated when the cursor is moved
      update_on_cursor_moved = true,
    },
    -- Set to true to watch the filesystem for changes and reload oil
    watch_for_changes = false,
  },
  config = function(_, opts)
    require("oil").setup(opts)
    -- Auto-open preview when oil opens
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilEnter",
      callback = vim.schedule_wrap(function(args)
        local oil = require("oil")
        if vim.api.nvim_get_current_buf() == args.data.buf then
          oil.open_preview()
        end
      end),
    })
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
}
