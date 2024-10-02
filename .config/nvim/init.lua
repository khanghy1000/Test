vim.g.mapleader = ' '

-- lazyvim setup ---------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "xiyaowong/fast-cursor-move.nvim",
  "tpope/vim-surround",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
})

------------------------------------------------------------

vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos"

-- disable marcos
vim.keymap.set("n", "q", "")
vim.keymap.set("v", "q", "")

-- remove search highlights
vim.keymap.set("n", "<leader>h", "<Cmd>noh<CR>")
vim.keymap.set("v", "<leader>h", "<Cmd>noh<CR>")

-- del without yank
vim.keymap.set('n', "<BS>", '"_dd')
vim.keymap.set('v', "<BS>", '"_d')

-- yank/paste then move cursor to last pasted line
vim.keymap.set("n", "p", "p`]")
vim.keymap.set("v", "p", "p`]")

vim.keymap.set("v", "y", "y`]")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local function trim()
  local save = vim.fn.winsaveview()
  vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
  vim.fn.winrestview(save)
end

-- remove \r
vim.api.nvim_set_keymap("n", "<leader>fp", '', {
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
    vim.fn.winrestview(save)
  end
})

