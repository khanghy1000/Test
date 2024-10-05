return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    local api = require 'typescript-tools.api'
    require('typescript-tools').setup {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeCompletionsForModuleExports = true,
        },
      },
    }
  end,
}
