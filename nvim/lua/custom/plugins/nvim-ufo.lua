return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',
  config = function()
    -- LSP -> Treesitter -> Indent fallback chain.
    -- ufo throws UfoFallbackException when a provider has no folds; catch and try the next.
    local function selector(bufnr)
      local function fallback(err, providerName)
        if type(err) == 'string' and err:match 'UfoFallbackException' then
          return require('ufo').getFolds(bufnr, providerName)
        end
        return require('promise').reject(err)
      end

      return require('ufo')
        .getFolds(bufnr, 'lsp')
        :catch(function(err)
          return fallback(err, 'treesitter')
        end)
        :catch(function(err)
          return fallback(err, 'indent')
        end)
    end

    require('ufo').setup {
      provider_selector = function()
        return selector
      end,
    }

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

    -- Report which provider ufo is using for the current buffer.
    local function showProvider()
      local bufnr = vim.api.nvim_get_current_buf()
      local ufo = require 'ufo'
      local function tell(name)
        vim.notify('ufo provider: ' .. name, vim.log.levels.INFO)
      end
      local function isFallback(err)
        return type(err) == 'string' and err:match 'UfoFallbackException'
      end
      ufo.getFolds(bufnr, 'lsp')
        :thenCall(function()
          tell 'LSP'
        end)
        :catch(function(err)
          if not isFallback(err) then
            return
          end
          ufo.getFolds(bufnr, 'treesitter')
            :thenCall(function()
              tell 'Treesitter'
            end)
            :catch(function(err2)
              if isFallback(err2) then
                tell 'Indent (whitespace)'
              end
            end)
        end)
    end
    vim.keymap.set('n', 'zI', showProvider, { desc = 'Fold provider info (ufo)' })
  end,
}
