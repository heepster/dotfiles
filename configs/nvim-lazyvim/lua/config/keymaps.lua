-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>m", "<cmd>lua MiniMap.toggle()<cr>", { desc = "Toggle Mini Map" })

-- Remove keymaps for easy window traversal
-- (I prefer using <C-w>hjkl)
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

-- <C-;> doesn't work for some reason
-- I can neither delete an existing map or set it
-- vim.keymap.del("i", "<C-;>")
-- vim.keymap.set("i", "<C-;>", "<esc>", { desc = "Escape" })

-- This makes Escape easier on Moonlander keyboard
vim.keymap.set({ "n", "i" }, "<C-\\>", "<esc>", { desc = "Escape" })

vim.keymap.set({ "n", "i" }, "<C-l>", "$", { desc = "Beginning of line" })
vim.keymap.set({ "n", "i" }, "<C-h>", "^", { desc = "End of line" })
