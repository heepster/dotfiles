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
		{ "<C-f>", "<cmd>Telescope find_files<cr>", desc = "Search files by name" },
		{ "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Search in files" },
		{ "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Search buffers" },
		{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "Show references" },
		{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
		{ "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementation" },
		{ "gp", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to type definition" },
    }
}
