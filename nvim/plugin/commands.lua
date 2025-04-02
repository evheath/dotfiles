vim.api.nvim_create_user_command('CloseOthers', function()
  vim.cmd 'silent! %bd | e# | bd#'
end, {})

vim.api.nvim_create_user_command('RevealInFinder', function()
  local file = vim.fn.expand '%:p'
  if file ~= '' then
    vim.fn.system { 'open', '-R', file }
  else
    print 'No file to reveal'
  end
end, {})
