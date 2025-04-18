-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
vim.cmd "colorscheme rose-pine"
-- vim.cmd "colorscheme catppuccin"
vim.o.termguicolors = true

-- Mapping
vim.keymap.set("", "<Up>", "<Nop>")
vim.keymap.set("", "<Down>", "<Nop>")
vim.keymap.set("", "<Left>", "<Nop>")
vim.keymap.set("", "<Right>", "<Nop>")

function Runcpp()
  -- vim.cmd "write %"
  vim.cmd "!g++ % -o %:r && ./%:r"
end

-- vim.keymap.set("", "<F11>", Runcpp)

-- Compile
--vim.keymap.set("", "<Leader>r", function() vim.cmd "write && !g++ % -o %:r && ./%:r" end, { desc = "Run" })
vim.keymap.set("", "<Leader>r", Runcpp, { desc = "Run", silent = true })

-- Clear buffer
vim.keymap.set("", "<Leader>bx", function() vim.cmd ":%d" end, { desc = "Clear" })
