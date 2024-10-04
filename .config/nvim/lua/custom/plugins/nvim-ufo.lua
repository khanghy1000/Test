return {
  'kevinhwang91/nvim-ufo',
  event = 'BufRead',
  dependencies = {
    'kevinhwang91/promise-async',
  },

  init = function()
    vim.o.foldenable = true
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
  end,

  config = function()
    require('ufo').setup()

    -- peek folded
    vim.keymap.set('n', 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'Show hover' })

    -- Harpoon workaround
    require('harpoon'):extend(require('harpoon.extensions').builtins.command_on_nav 'UfoEnableFold')
  end,
}
