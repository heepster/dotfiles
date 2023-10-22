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

-- Easier Escape remaps
vim.keymap.set("i", "jk", "<esc>", { desc = "Escape" })
vim.keymap.set("i", "kj", "<esc>", { desc = "Escape" })

-- Easier line traversals
vim.keymap.set({ "n", "i" }, "<C-l>", "$", { desc = "Beginning of line" })
vim.keymap.set({ "n", "i" }, "<C-h>", "^", { desc = "End of line" })

-- Easier save/close file
vim.keymap.set({ "n", "i", "v" }, "<C-q>", ":q!<cr>", { desc = "Close without saving" })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<esc>:w<cr>", { desc = "Save" })

-- Functionality
vim.keymap.set({ "n", "i", "v" }, "<C-e>", "<esc>:Neotree toggle<cr>", { desc = "ToggleNeoTree" })
vim.keymap.set({ "n", "i", "v" }, "<C-p>", "<esc>:Telescope find_files<cr>", { desc = "Find files in cwd" })
