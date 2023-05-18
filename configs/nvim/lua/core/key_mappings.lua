local map_options = { noremap = true }

-- Set leader to space
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Better Escape
vim.keymap.set('i', 'jk', '<ESC>', map_options)

-- Save file
vim.keymap.set({'n', 'i' }, '<C-s>', '<ESC>:w<CR>', map_options)

-- Exit / Close
vim.keymap.set({'n', 'i' }, '<C-q>', '<ESC>:q!<CR>', map_options)

-- Tab Navigation
vim.keymap.set('n', '<C-t>l', ':tabnext<CR>', map_options)
vim.keymap.set('n', '<C-t>h', ':tabprev<CR>', map_options)

-- Source Nvim config
vim.keymap.set('n', '<Leader>s', ':so $MYVIMRC<CR>', map_options)

-- Packer Sync
vim.keymap.set('n', '<Leader>p', ':PackerSync<CR>', map_options)

-- NvimTree
vim.keymap.set({'n', 'i'}, '<C-e>', '<ESC>:NvimTreeToggle<CR>', map_options)

-- Telescope
vim.keymap.set({'n'}, '<C-p>', ':Telescope find_files<CR>', map_options)
vim.keymap.set({'n'}, '<C-a>', ':Telescope live_grep<CR>', map_options)
vim.keymap.set({'n'}, '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', map_options)
vim.keymap.set({'n'}, '<C-g>', ':Telescope git_bcommits<CR>', map_options)
vim.keymap.set({'n'}, '<Leader>k', ':Telescope keymaps<CR>', map_options)

-- COC
-- Located in plugin_config/coc.lua

