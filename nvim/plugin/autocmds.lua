-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- disabled for now because telescope previews were causing flickering
-- Auto command to change colorscheme on mode change
-- vim.api.nvim_create_autocmd('ModeChanged', {
--   pattern = '*',
--   callback = function()
--     local mode = vim.fn.mode()
--     local theme = 'catppuccin-frappe'
--     if mode == 'n' then
--       theme = 'catppuccin-macchiato'
--     elseif mode == 'i' or mode == 't' then
--       theme = 'catppuccin-mocha'
--     end
--
--     -- small delay needed for telescope
--     vim.defer_fn(function()
--       vim.cmd('colorscheme ' .. theme)
--       -- vim.api.nvim_echo({ { 'Switched to ' .. theme, 'WarningMsg' } }, false, {})
--     end, 50)
--   end,
-- })

-- this also gets tripped up by telescope
-- write when mode switching insert->normal
-- vim.api.nvim_create_autocmd('ModeChanged', {
--   pattern = 'i:n',
--   callback = function()
--     print 'auto write'
--     vim.cmd 'write'
--   end,
-- })

-- turn on spell checking for certain filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = { '*.go', '*.md', '*.ts', '*.lua' },
  callback = function()
    if vim.bo.modified and vim.bo.modifiable and vim.bo.buftype == '' then
      vim.cmd 'write'
    end
  end,
})
