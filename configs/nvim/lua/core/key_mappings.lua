local map_options = { noremap = true }

vim.g.mapleader = ','

-- Save file
vim.keymap.set({'n', 'i' }, '<C-s>', ':w<CR>', map_options)

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

-- COC
vim.keymap.set({'n'}, 'gd', '<Plug>(coc-definition)', map_options)
vim.keymap.set({'n'}, 'gy', '<Plug>(coc-type-definition)', map_options)
vim.keymap.set({'n'}, 'gi', '<Plug>(coc-implementation)', map_options)
vim.keymap.set({'n'}, 'gr', '<Plug>(coc-references)', map_options)
vim.keymap.set({'n'}, 'gr', '<Plug>(coc-references)', map_options)
vim.keymap.set({'n'}, 'gI', '<Plug>(coc-codeaction-cursor)', map_options)
vim.keymap.set({'n'}, 'gn', '<Plug>(coc-rename)', map_options)
vim.keymap.set({'n'}, 'ga', ':<C-u>CocList diagnostics<CR>', map_options)

