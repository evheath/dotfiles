local date_format = '%Y%m%d-%a'
-- https://github.com/epwalsh/obsidian.nvim
return {
  'epwalsh/obsidian.nvim',
  version = '*', -- use latest release instead of latest commit
  lazy = false, -- allow use of obsidian commands anywhere
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    ui = { enable = false },
    workspaces = {
      {
        name = 'notes',
        path = '~/notes',
      },
    },
    notes_subdir = 'permanent',
    mappings = {
      ['<leader>of'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = '[f]ollow link' },
      },
    },
    new_notes_location = 'notes_subdir',
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        return os.date(date_format) .. '-' .. suffix
      end
      return suffix
    end,
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
    templates = {
      folder = 'templates',
    },
    daily_notes = {
      folder = 'fleeting',
      date_format = date_format,
      template = 'daily',
    },
  },
}
