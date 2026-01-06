-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.opt.clipboard = "unnamedplus"

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "MonoLisa,Symbols Nerd Font"
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.0
  vim.g.neovide_theme = "light"
end
