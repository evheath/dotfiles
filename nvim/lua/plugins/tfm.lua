return {
  'rolv-apneseth/tfm.nvim',
  lazy = false,
  opts = {
    file_manager = 'yazi',
    replace_netrw = true,
    -- Commands:
    --   Tfm: selected file(s) will be opened in the current window
    --   TfmSplit: selected file(s) will be opened in a horizontal split
    --   TfmVsplit: selected file(s) will be opened in a vertical split
    --   TfmTabedit: selected file(s) will be opened in a new tab page
    enable_cmds = true,
    -- Custom keybindings only applied within the TFM buffer
    keybindings = {
      ['<ESC>'] = 'q',
      ['<M-e>'] = 'q',
      -- ['<C-v>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
      -- ['<C-x>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
      -- ['<C-t>'] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
    },
  },
}
