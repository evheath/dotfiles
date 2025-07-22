-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()

    -- Set comment strings for ERB files to use HTML comments
    local ft = require 'Comment.ft'
    -- Use HTML comments for ERB files
    ft.set('eruby', { '<%#%s%>', '<%#%s%>' })
    ft.set('erb', { '<%#%s%>', '<%#%s%>' })
    ft.set('embedded_template', { '<%#%s%>', '<%#%s%>' })
  end,
}
