return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local rel_buf_name = vim.fn.fnamemodify(buf_name, ':.')
      vim.print('"' .. rel_buf_name .. '"' .. ' added to Harpoon')
    end, { desc = '[Add] file to Harpoon' })

    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon window' })
  end,
}
