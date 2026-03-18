return {
  'rafi/telescope-thesaurus.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  keys = {
    { 'z-', '<cmd>Telescope thesaurus lookup<cr>', desc = 'Thesaurus lookup' },
  },
  config = function()
    require('telescope').setup({
      extensions = {
        thesaurus = {
          provider = 'datamuse',
        },
      },
    })
    require('telescope').load_extension('thesaurus')
  end,
}
