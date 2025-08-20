-- <D-*> ⌘ command
-- <M-*> ⌥ option
-- <C-*> ⌃ control
-- <S-*> 󰘶 shift

-- disable horizontal scrolling
vim.keymap.set('', '<ScrollWheelLeft>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('', '<ScrollWheelRight>', '<Nop>', { noremap = true, silent = true })

-- oil
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open oil, here' })
vim.keymap.set('n', '_', '<cmd>Oil .<CR>', { desc = 'Open oil, project' })

-- notifications
vim.keymap.set('n', '<leader>sn', '<cmd>Telescope noice<CR>', { desc = '[n]otifications' })

-- buffers
vim.keymap.set('n', '<S-l>', '<cmd>bn<CR>', { desc = 'next buffer' })
vim.keymap.set('n', ']b', '<cmd>bn<CR>', { desc = 'next buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>bp<CR>', { desc = 'previous buffer' })
vim.keymap.set('n', '[b', '<cmd>bp<CR>', { desc = 'previous buffer' })
-- vim.keymap.set('n', '<M-w>', '<cmd>bd<CR>', { desc = 'close buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'close buffer' })
vim.keymap.set('n', '<leader>bt', '<cmd>enew<CR>', { desc = 'new empty buffer' })
vim.keymap.set('n', '<leader>bo', '<cmd>CloseOthers<CR>', { desc = 'close other buffers' })
vim.keymap.set('n', '[B', '<cmd>BufferLineMovePrev<CR>', { desc = 'move buffer left' })
vim.keymap.set('n', ']B', '<cmd>BufferLineMoveNext<CR>', { desc = 'move buffer right' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', { desc = '[p]in' })
vim.keymap.set('n', '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'close non-[P]inned' })
-- vim.keymap.set('n', '<M-3>', '<cmd>b#<CR>', { desc = 'buffer quickswitch' })
vim.keymap.set('n', '<leader>`', '<cmd>b#<CR>', { desc = 'buffer quickswitch' })

-- navigation
vim.keymap.set({ 'n', 't' }, '\\', '<cmd>Floaterminal<CR>', { desc = 'Open Floating Terminal' })
-- vim.keymap.set('n', '<M-d>', '<C-d>zz', { desc = 'Page down' })
-- vim.keymap.set('n', '<M-u>', '<C-u>zz', { desc = 'Page up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page up' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
-- vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

-- Escape
vim.keymap.set('n', '<Esc>', function()
  vim.cmd 'nohlsearch' -- clear any searches

  -- Don't close if we're in the snacks explorer
  -- local win_config = vim.api.nvim_win_get_config(0)
  -- if win_config.relative ~= '' and not vim.bo.filetype:match 'snacks_picker' then
  --   vim.cmd 'fclose' -- close any floating window (except snacks explorer)
  -- end

  if vim.wo.diff then
    vim.cmd 'diffoff' -- toggle diff off
    vim.cmd 'only' -- toggle diff off
  end
end)

-- terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'terminal to normal mode' })
-- vim.keymap.set('t', '<M-l>', '<C-l>', { desc = 'clear terminal' })

-- diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[q]uickfix' }) -- maybe enable when I understand this

-- LSP
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[r]ename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[a]ctions' })
vim.keymap.set('n', '<leader>ct', vim.lsp.buf.hover, { desc = 'peek [t]ype' })

-- sourcing
vim.keymap.set('n', '<leader>x', function()
  vim.cmd 'source %'
  print('sourced ' .. vim.fn.expand '%')
end, { desc = 'source current file' })

-- comments
-- vim.keymap.set('n', '<M-/>', 'gcc', { desc = 'comment', remap = true })
-- vim.keymap.set('v', '<M-/>', 'gc', { desc = 'comment', remap = true })

-- void
vim.keymap.set('x', '<leader>p', [["_dp]], { desc = 'void paste' })
vim.keymap.set('x', '<leader>P', [["_dP]], { desc = 'void Paste' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'void delete' })

-- toggles
vim.keymap.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = '[w]ord wrap' })
vim.keymap.set('n', '<leader>tr', ':set relativenumber! <CR>', { desc = '[r]elative line numbers' })
vim.keymap.set('n', '<leader>tn', ':set nu! relativenumber!<CR>', { desc = 'line [n]umbers' })
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'git [b]lame' })
vim.keymap.set('n', '<leader>ts', function()
  vim.wo.spell = not vim.wo.spell
  print('Spell check ' .. (vim.wo.spell and 'enabled' or 'disabled'))
end, { desc = '[s]pellcheck' })
vim.keymap.set('n', '<leader>tz', function()
  -- Close snacks explorer if it's open
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
    if ft:match 'snacks_picker' then
      vim.api.nvim_win_close(win, true)
    end
  end

  -- Focus current window by closing all others
  vim.cmd 'only'
end, { desc = '[z]en mode' })

-- copilot
vim.keymap.set('n', '<leader>ld', function()
  vim.cmd 'Copilot disable'
  vim.notify 'Copilot disabled'
end, { desc = '[d]isable' })
vim.keymap.set('n', '<leader>le', function()
  vim.cmd 'Copilot enable'
  vim.notify 'Copilot enabled'
end, { desc = '[e]nable' })
vim.keymap.set('n', '<leader>ls', '<cmd>Copilot status<CR>', { desc = '[s]tatus' })

-- move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- obsidian commands safe to use outside obsidian
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[n]ew' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = '[t]oday' })
vim.keymap.set('n', '<leader>or', '<cmd>ObsidianRename<CR>', { desc = '[r]ename' })
