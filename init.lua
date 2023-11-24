--[[ init.lua ]]
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- IMPORTS --
require("vars")     -- Variables
require("ftplugin") -- Filetypes definitions.
require("opts")     -- Options
require("keys")     -- Keymaps

require("lazy").setup(
  {
    { import = "themes.nightfox" },
    { import = "plugins" },
    { import = "lsp" }
  },
  {
    change_detection = { notify = false },
    ui = { border = vim.g.border }
  }
)