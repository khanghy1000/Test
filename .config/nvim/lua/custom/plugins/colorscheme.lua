return {
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      transparent = true,
    },
    init = function()
      vim.cmd.colorscheme 'kanagawa-dragon'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    enabled = false,
    priority = 1000,
    opts = { options = { transparent = true } },
    init = function()
      vim.cmd.colorscheme 'nightfox'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- enabled = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          CmpItemAbbrMatch = { style = {} },
          CmpItemAbbrMatchFuzzy = { style = {} },
          -- PmenuSel = { style = {} },
        }
      end,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
}
