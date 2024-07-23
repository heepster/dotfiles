return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    opts = {
        defaults = {
            file_ignore_patterns = { 'node_modules', '.git' },
            mappings = {
                i = {
                  ["<C-j>"] = "move_selection_next",
                  ["<C-k>"] = "move_selection_previous",
                },
            },
        }
    },
    config = function(lp, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('fzf')
    end,
    keys = {
		{ "<C-f>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
    }
}