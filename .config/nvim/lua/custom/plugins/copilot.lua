-- Copilot in virtual text
return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-e>',
        },
      },
    }

    local cmp = require 'cmp'
    cmp.event:on('menu_opened', function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on('menu_closed', function()
      vim.b.copilot_suggestion_hidden = false
    end)
  end,
}

-- Copilot as cmp source
-- return {
--   'zbirenbaum/copilot-cmp',
--   dependencies = {
--     {
--       'zbirenbaum/copilot.lua',
--       cmd = 'Copilot',
--       event = 'InsertEnter',
--       config = function()
--         require('copilot').setup {
--           suggestion = { enabled = false },
--           panel = { enabled = false },
--         }
--       end,
--     },
--   },
--
--   config = function()
--     require('copilot_cmp').setup()
--   end,
-- }
