vim.api.nvim_create_user_command('CloseOthers', function()
  vim.cmd 'silent! %bd | e# | bd#'
end, {})
