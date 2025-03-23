-- <D-*> ⌘ command
-- <M-*> ⌥ option
-- <C-*> ⌃ control
-- <S-*> 󰘶 shift

-- disable horizontal scrolling
vim.keymap.set('', '<ScrollWheelLeft>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('', '<ScrollWheelRight>', '<Nop>', { noremap = true, silent = true })

-- navigation
vim.keymap.set('n', '<M-Tab>', '<cmd>bn<CR>', { desc = 'move to next buffer' })
-- vim.keymap.set('n', '<M-S-Tab>', '<cmd>bn<CR>', { desc = 'move to previous buffer' }) -- M-S-Tab does not work atm
vim.keymap.set('n', '<M-w>', '<cmd>bd<CR>', { desc = 'close buffer' })
vim.keymap.set('n', '<M-W>', '<cmd>bd!<CR>', { desc = 'force close buffer' })
-- vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<M-e>', '<cmd>Tfm<CR>', { desc = 'open terminal filesystem manager' })
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open oil filesystem' })

-- Escape help
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR><cmd>fclose<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- diagnostic
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[q]uickfix' }) -- maybe enable when I understand this

-- telescope
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>', { desc = '[s]earch vim [h]elp' })
vim.keymap.set('n', '<leader>sk', '<cmd>Telescope keymaps<CR>', { desc = '[s]earch [k]eymaps' })
vim.keymap.set('n', '<leader>sp', '<cmd>Telescope find_files<CR>', { desc = '[s]earch [p]roject files, all' })
vim.keymap.set('n', '<M-p>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<M-Space>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>sP', '<cmd>Telescope git_files<CR>', { desc = '[s]earch [P]roject files, git' })
vim.keymap.set('n', '<M-P>', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = '[s]earch with [g]rep here' })
vim.keymap.set('n', '<M-f>', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
vim.keymap.set('n', '<leader>sG', '<cmd>Telescope live_grep<CR>', { desc = '[s]earch with [G]rep in project' })
vim.keymap.set('n', '<M-S-f>', '<cmd>Telescope live_grep<CR>')

-- LSP
vim.keymap.set('n', '<leader>cf', '<cmd>Telescope lsp_references<CR>', { desc = '[c]ode [f]ind references' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[c]ode [r]ename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[c]ode [a]ction' })
vim.keymap.set('n', '<leader>ct', vim.lsp.buf.hover, { desc = '[c]ode peek [t]ype' })

-- comments
vim.keymap.set('n', '<M-/>', 'gcc', { desc = 'comment', remap = true })
vim.keymap.set('v', '<M-/>', 'gc', { desc = 'comment', remap = true })

-- git
-- vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status', { desc = '[g]it [s]tatus' })
-- vim.keymap.set('n', '<leader>ga', '<cmd> ! git add .<CR>', { desc = '[g]it stage [a]ll' })

-- toggles
vim.keymap.set('n', '<leader>tr', ':set relativenumber! <CR>', { desc = '[t]oggle [r]elative line numbers' })
vim.keymap.set('n', '<leader>tn', ':set nu! relativenumber!<CR>', { desc = '[t]oggle line [n]umbers' })
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[t]oggle [b]lame' })

-- move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
