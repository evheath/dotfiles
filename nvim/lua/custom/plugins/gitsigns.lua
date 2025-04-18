-- https://github.com/lewis6991/gitsigns.nvim
return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[s]tage, hunk' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[r]eset, hunk' })
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage, hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset, hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage, buffer' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset, buffer' })
        map('n', '<leader>td', function()
          if vim.wo.diff then
            vim.cmd 'diffoff'
            vim.cmd 'only'
          else
            gitsigns.diffthis()
          end
        end, { desc = 'view [d]iff vs staged' })
        map('n', '<leader>tD', function()
          if vim.wo.diff then
            vim.cmd 'diffoff'
            vim.cmd 'only'
          else
            gitsigns.diffthis '@'
          end
        end, { desc = 'view [D]iff vs commit' })
      end,
    },
  },
}
