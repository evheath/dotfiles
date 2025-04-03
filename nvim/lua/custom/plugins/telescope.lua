-- https://github.com/nvim-telescope/telescope.nvim
return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  lazy = false,
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        preview = {
          filesize_limit = 0.1, -- MB
        },
        file_ignore_patterns = {
          '^node_modules/',
          '^.git/',
          '^.obsidian/',
          '^.DS_Store',
        },
        mappings = {
          i = { ['<esc>'] = require('telescope.actions').close },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- telescope keymaps
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = '~/notes/' }
    end, { desc = '[s]earch [n]otes' })
    vim.keymap.set('n', '<leader>sd', function()
      builtin.find_files { cwd = '~/code/dotfiles/' }
    end, { desc = '[s]earch [d]otfiles' })

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
