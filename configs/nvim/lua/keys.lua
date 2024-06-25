-- Line traversal
vim.keymap.set({ "n", "i", "v" }, "<C-l>", "20l", { desc = "Beginning of line" })
vim.keymap.set({ "n", "i", "v" }, "<C-h>", "20h", { desc = "End of line" })

-- Page traversal
vim.keymap.set({ "n", "v" }, "<C-j>", "10j", { desc = "Page down" })
vim.keymap.set({ "n", "v" }, "<C-k>", "10k", { desc = "Page up" })


