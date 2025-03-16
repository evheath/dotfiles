-- <D-*> ⌘ command
-- <M-*> ⌥ option
-- <C-*> ⌃ control
-- <S-*> 󰘶 shift

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[q]uickfix' }) -- maybe enable when I understand this

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch vim [h]elp' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[s]earch [k]eymaps' })

vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[p]roject files, all' })
vim.keymap.set('n', '<leader>P', require('telescope.builtin').git_files, { desc = '[P]roject files, git' })
vim.keymap.set('n', '<leader>f', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[f]ind here' })

vim.keymap.set('n', '<leader>F', require('telescope.builtin').live_grep, { desc = '[F]ind in project' })

vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'comment', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'comment', remap = true })

vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[g]it [s]tatus' })
vim.keymap.set('n', '<leader>ga', '<cmd> ! git add .<CR>', { desc = '[g]it stage [a]ll' })

vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').buffers, { desc = 'buffers' })

vim.keymap.set('n', '<leader>tr', ':set relativenumber! <CR>', { desc = '[t]oggle [r]elative line numbers' })
vim.keymap.set('n', '<leader>tn', ':set nu! relativenumber!<CR>', { desc = '[t]oggle line [n]umbers' })

-- move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
