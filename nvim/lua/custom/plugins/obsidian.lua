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
    dir = '~/notes/',
    notes_subdir = 'fleeting',
    mappings = {
      ['<leader>of'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = '[o]bsidian [f]ollow link' },
      },
    },
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return os.date(date_format) .. '-' .. suffix
    end,
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local out = { aliases = note.aliases, tags = note.tags }
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
