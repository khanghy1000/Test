local utils = require 'custom.utils'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    if vim.fn.argv(0) == '.' or vim.fn.argv(0) == '' then
      vim.cmd 'Neotree reveal'
      vim.cmd 'TmuxNavigateRight'
    end
  end,
})

vim.keymap.set('n', '<leader>bd', utils.bufremove, { desc = 'Delete Buffer' })

-- disable marcos
vim.keymap.set('n', 'q', '')
vim.keymap.set('v', 'q', '')

-- del without yank
vim.keymap.set('n', 'D', '')
vim.keymap.set('v', 'D', '')
vim.keymap.set('n', 'D', '"_dd')
vim.keymap.set('v', 'D', '"_d')

-- yank/paste then move cursor to last pasted line
vim.keymap.set('n', 'p', 'p`]')
vim.keymap.set('v', 'p', 'p`]')
vim.keymap.set('v', 'y', 'y`]')

-- move half page then center screen
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- jump between paragraphs then center screen
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')

-- jump between search then center screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- replace without replace paste register
vim.keymap.set('x', '<leader>p', [["_dP]])

-- <Esc> binding
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

-- run tmux sessionizer
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- vim: ts=2 sts=2 sw=2 et
