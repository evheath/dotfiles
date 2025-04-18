-- <D-*> ⌘ command
-- <M-*> ⌥ option
-- <C-*> ⌃ control
-- <S-*> 󰘶 shift

-- disable horizontal scrolling
vim.keymap.set('', '<ScrollWheelLeft>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('', '<ScrollWheelRight>', '<Nop>', { noremap = true, silent = true })

-- navigation
-- vim.keymap.set('n', '<Tab>', '<cmd>bn<CR>', { desc = 'move to next buffer' })
-- vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>', { desc = 'move to previous buffer' })
vim.keymap.set('n', '<M-w>', '<cmd>bd<CR>', { desc = 'close buffer' })
-- vim.keymap.set('n', '<M-w>', function()
--   if #vim.api.nvim_list_wins() > 1 then
--     vim.cmd 'close'
--   else
--     vim.cmd 'bdelete'
--   end
-- end, { desc = 'close window or delete buffer' })
vim.keymap.set('n', '<M-W>', '<cmd>bd!<CR>', { desc = 'force close buffer' })
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<M-3>', '<cmd>b#<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open oil, here' })
vim.keymap.set('n', '_', '<cmd>Oil .<CR>', { desc = 'Open oil, project' })
vim.keymap.set({ 'n', 't' }, '\\', '<cmd>Floaterminal<CR>', { desc = 'Open Floating Terminal' })
vim.keymap.set('n', '<M-d>', '<C-d>zz', { desc = 'Page down' })
vim.keymap.set('n', '<M-u>', '<C-u>zz', { desc = 'Page up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page up' })

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

-- LSP
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[c]ode [r]ename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[c]ode [a]ction' })
vim.keymap.set('n', '<leader>ct', vim.lsp.buf.hover, { desc = '[c]ode peek [t]ype' })

-- sourcing
vim.keymap.set('n', '<leader>x', function()
  vim.cmd 'source %'
  print('sourced ' .. vim.fn.expand '%')
end, { desc = 'source current file' })

-- comments
vim.keymap.set('n', '<M-/>', 'gcc', { desc = 'comment', remap = true })
vim.keymap.set('v', '<M-/>', 'gc', { desc = 'comment', remap = true })

-- void
vim.keymap.set('x', '<leader>p', [["_dp]], { desc = 'void paste' })
vim.keymap.set('x', '<leader>P', [["_dP]], { desc = 'void Paste' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'void delete' })

-- toggles
vim.keymap.set('n', '<leader>tr', ':set relativenumber! <CR>', { desc = '[t]oggle [r]elative line numbers' })
vim.keymap.set('n', '<leader>tn', ':set nu! relativenumber!<CR>', { desc = '[t]oggle line [n]umbers' })
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[t]oggle [b]lame' })
vim.keymap.set('n', '<leader>tt', '<cmd>Floaterminal<CR>', { desc = '[t]oggle floating [t]erminal' })
vim.keymap.set('n', '<leader>ts', function()
  vim.wo.spell = not vim.wo.spell
  print('Spell check ' .. (vim.wo.spell and 'enabled' or 'disabled'))
end, { desc = '[t]oggle [s]pellcheck' })

-- move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- obsidian commands safe to use outside obsidian
-- vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = '[o]bsidian [s]earch' })
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[o]bsidian [n]ew' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = '[o]bsidian [t]oday' })
vim.keymap.set('n', '<leader>or', '<cmd>ObsidianRename<CR>', { desc = '[o]bsidian [r]ename' })
