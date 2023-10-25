-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

-- WHICH KEY
wk.register({
  ["<leader>L"] = { name = "+Lazy" },
  ["<leader>l"] = { name = "+line" },
  ["<leader>s"] = { name = "+save/close" },
  ["<leader>f"] = {
    name = "+find",
    b = "which_key_ignore",
    c = "which_key_ignore",
    e = "which_key_ignore",
    E = "which_key_ignore",
    F = "which_key_ignore",
    n = "which_key_ignore",
    r = "which_key_ignore",
    R = "which_key_ignore",
    t = "which_key_ignore",
    T = "which_key_ignore",
  },
  ["<leader>q"] = { name = "close file without saving" },
  ["<leader>"] = {
    [","] = "which_key_ignore",
    ["-"] = "which_key_ignore",
    ["|"] = "which_key_ignore",
    ["`"] = "which_key_ignore",
    ["E"] = "which_key_ignore",
    ["e"] = "Toggle sidebar",
  },
})
-- END WHICH KEY

-- UNMAP KEYS
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<leader><space>")
vim.keymap.del("n", "<leader>E")
-- <leader>f
vim.keymap.del("n", "<leader>fF")
vim.keymap.del("n", "<leader>fb")
vim.keymap.del("n", "<leader>fc")
vim.keymap.del("n", "<leader>fe")
vim.keymap.del("n", "<leader>fE")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>fR")
-- <leader>l/L
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>l")
-- Terminal
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")
-- END UNMAP KEYS

-- Lazy
vim.keymap.set("n", "<leader>Ll", "<cmd>Lazy<cr>", { desc = "Lazy dashboard" })
vim.keymap.set("n", "<leader>Lg", "<cmd>Lazy log<cr>", { desc = "Show Lazy log" })

-- General
vim.keymap.set("n", "<leader>e", "<esc>:Neotree toggle dir=.<cr>", { desc = "Toggle sidebar" })
vim.keymap.set("n", "<leader>ff", "<esc>:Telescope find_files<cr>", { desc = "Find file in cwd" })
vim.keymap.set("n", "<leader>fs", "<esc>:Telescope current_buffer_fuzzy_find<cr>", { desc = "Find string in file" })
vim.keymap.set("n", "<leader>fg", "<esc>:Telescope live_grep<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fr", "<esc>:Telescope resume<cr>", { desc = "Resume last telescope search" })

-- Quitting / Saving
vim.keymap.set("n", "<leader>sl", "<cmd>wq<cr>", { desc = "Save and close file" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Close file without saving" })

-- Page traversal
vim.keymap.set("n", "n", "<C-d>", { desc = "Page down" })
vim.keymap.set("n", "o", "<C-u>", { desc = "Page up" })

-- Line traversal
vim.keymap.set("n", "<leader>ll", "$", { desc = "End of line" })
vim.keymap.set("n", "<leader>lh", "^", { desc = "Beginning of line" })
vim.keymap.set({ "n", "i", "v" }, "<C-l>", "$", { desc = "Beginning of line" })
vim.keymap.set({ "n", "i", "v" }, "<C-h>", "^", { desc = "End of line" })

-- Window traversal
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Focus window right" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Focus window left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Focus window down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Focus window up" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontal" })

-- Escape
vim.keymap.set({ "i" }, "jk", "<esc>", { desc = "Escape" })
vim.keymap.set({ "i" }, "kj", "<esc>", { desc = "Escape" })
