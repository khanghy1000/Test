return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'
    local set = vim.keymap.set
    mc.setup()

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'v' }, '<leader>n', function()
      mc.matchAddCursor(1)
    end, { desc = '[N] Add cursor to next word by matching word/selection' })
    set({ 'n', 'v' }, '<leader>j', function()
      mc.matchSkipCursor(1)
    end, { desc = '[J] Skip cursor to next word by matching word/selection' })

    -- Add and remove cursors with control + left click.
    set('n', '<c-leftmouse>', mc.handleMouse)

    set('n', '<esc>', function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        vim.cmd 'nohlsearch'
      end
    end, { desc = 'Clear cursors' })

    -- Append/insert for each line of visual selections.
    set('v', 'I', mc.insertVisual, { desc = 'Insert cursor for each line of visual selections' })
    set('v', 'A', mc.appendVisual, { desc = 'Append cursor for each line of visual selections' })

    -- match new cursors within visual selections by regex.
    set('v', 'M', mc.matchCursors, { desc = 'Match cursors within visual selections' })

    -- Easy way to add and remove cursors using the main cursor.
    set({ 'n', 'v' }, '<leader>mt', mc.toggleCursor, { desc = '[T]oggle cursors' })

    -- bring back cursors if you accidentally clear them
    set('n', '<leader>mr', mc.restoreCursors, { desc = '[R]estore cursors' })

    -- Align cursor columns.
    set('v', '<leader>ma', mc.alignCursors, { desc = '[A]lign cursors' })

    -- Delete the main cursor.
    set({ 'n', 'v' }, '<leader>md', mc.deleteCursor, { desc = '[D]elete cursor' })

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
