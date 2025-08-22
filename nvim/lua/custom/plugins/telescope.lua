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
          -- i = { ['<esc>'] = require('telescope.actions').close },
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

    vim.keymap.set('n', '<leader>so', function()
      builtin.live_grep { cwd = '~/notes/' }
    end, { desc = '[o]bsidian' })
    vim.keymap.set('n', '<leader>os', function()
      builtin.live_grep { cwd = '~/notes/' }
    end, { desc = '[s]earch' })
    vim.keymap.set('n', '<leader>sd', function()
      builtin.find_files { cwd = '~/code/dotfiles/' }
    end, { desc = '[d]otfiles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'vim [h]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[k]eymaps' })
    -- vim.keymap.set('n', '<M-p>', builtin.find_files)
    -- vim.keymap.set('n', '<M-Space>', builtin.find_files)
    -- vim.keymap.set('n', '<M-P>', builtin.git_files)
    vim.keymap.set('n', '<leader>sp', builtin.find_files, { desc = '[p]roject, all' })
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[ ] find files' })
    vim.keymap.set('n', '<leader>sP', builtin.git_files, { desc = '[P]roject, git' })
    vim.keymap.set('n', '<M-f>', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<M-S-f>', builtin.live_grep)
    vim.keymap.set('n', '<leader>sG', builtin.live_grep, { desc = '[G]rep project' })
    vim.keymap.set('n', '<leader>sg', builtin.grep_string, { desc = '[g]rep word under cursor' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[b]uffers' })
    vim.keymap.set('n', '<leader>ss', builtin.resume, { desc = 'resume last [s]earch' })
    vim.keymap.set('n', '<leader>bs', builtin.buffers, { desc = '[s]earch' })

    vim.keymap.set('n', '<leader>cf', builtin.lsp_references, { desc = '[f]ind references' })

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
