-- <D-*> ⌘ command
-- <M-*> ⌥ option
-- <C-*> ⌃ control
-- <S-*> 󰘶 shift

-- disable horizontal scrolling
vim.keymap.set('', '<ScrollWheelLeft>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('', '<ScrollWheelRight>', '<Nop>', { noremap = true, silent = true })

-- standalone meta commands
vim.keymap.set('n', '<M-Tab>', '<cmd>bn<CR>') -- next buffer
-- vim.keymap.set('n', '<M-S-Tab>', '<cmd>bn<CR>') -- M-S-Tab does not work atm
vim.keymap.set('n', '<M-w>', '<cmd>bd<CR>') -- close buffer

-- Escape help
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Tmux/split navigation
vim.keymap.del('n', '<C-\\>')
vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

-- diagnostic
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[q]uickfix' }) -- maybe enable when I understand this

-- telescope
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch vim [h]elp' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[s]earch [k]eymaps' })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').find_files, { desc = '[s]earch [p]roject files, all' })
vim.keymap.set('n', '<M-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<M-Space>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sP', require('telescope.builtin').git_files, { desc = '[s]earch [P]roject files, git' })
vim.keymap.set('n', '<M-P>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[s]earch with [g]rep here' })
vim.keymap.set('n', '<M-f>', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sG', require('telescope.builtin').live_grep, { desc = '[s]earch with [G]rep in project' })
vim.keymap.set('n', '<M-S-f>', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').buffers, { desc = 'buffers' })

-- comments
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'comment', remap = true })
vim.keymap.set('n', '<M-/>', 'gcc', { desc = 'comment', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'comment', remap = true })
vim.keymap.set('v', '<M-/>', 'gc', { desc = 'comment', remap = true })

-- git
-- vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[g]it [s]tatus' })
-- vim.keymap.set('n', '<leader>ga', '<cmd> ! git add .<CR>', { desc = '[g]it stage [a]ll' })

-- toggles
vim.keymap.set('n', '<leader>tr', ':set relativenumber! <CR>', { desc = '[t]oggle [r]elative line numbers' })
vim.keymap.set('n', '<leader>tn', ':set nu! relativenumber!<CR>', { desc = '[t]oggle line [n]umbers' })

-- move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
