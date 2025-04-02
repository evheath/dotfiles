-- <D-*> ⌘ command
-- <M-*> ⌥ option
-- <C-*> ⌃ control
-- <S-*> 󰘶 shift

-- disable horizontal scrolling
vim.keymap.set('', '<ScrollWheelLeft>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('', '<ScrollWheelRight>', '<Nop>', { noremap = true, silent = true })

-- navigation
vim.keymap.set('n', '<M-Tab>', '<cmd>bn<CR>', { desc = 'move to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>', { desc = 'move to previous buffer' }) -- M-S-Tab actually sends S-Tab
vim.keymap.set('n', '<M-w>', function()
  if #vim.api.nvim_list_wins() > 1 then
    vim.cmd 'close'
  else
    vim.cmd 'bdelete'
  end
end, { desc = 'close window or delete buffer' })
vim.keymap.set('n', '<M-W>', '<cmd>bd!<CR>', { desc = 'force close buffer' })
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<M-3>', '<cmd>b#<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open oil filesystem' })
vim.keymap.set({ 'n', 't' }, '\\', '<cmd>Floaterminal<CR>', { desc = 'Open Floating Terminal' })
vim.keymap.set('n', '<M-d>', '<C-d>zz', { desc = 'Page down' })
vim.keymap.set('n', '<M-u>', '<C-u>zz', { desc = 'Page up' })

-- Escape
vim.keymap.set('n', '<Esc>', function()
  vim.cmd 'nohlsearch' -- clear any searches
  vim.cmd 'fclose' -- close any floating window
  if vim.wo.diff then
    vim.cmd 'diffoff' -- toggle diff off
    vim.cmd 'only' -- toggle diff off
  end
end)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'terminal to normal mode' })

-- terminal
vim.keymap.set('t', '<M-l>', '<C-l>', { desc = 'clear terminal' })

-- diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[q]uickfix' }) -- maybe enable when I understand this

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

-- void
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'void paste' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'void delete' })

-- toggles
vim.keymap.set('n', '<leader>tr', ':set relativenumber! <CR>', { desc = '[t]oggle [r]elative line numbers' })
vim.keymap.set('n', '<leader>tn', ':set nu! relativenumber!<CR>', { desc = '[t]oggle line [n]umbers' })
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[t]oggle [b]lame' })
vim.keymap.set('n', '<leader>tt', '<cmd>Floaterminal<CR>', { desc = '[t]oggle floating [t]erminal' })

-- move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
