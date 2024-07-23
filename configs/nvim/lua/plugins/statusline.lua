return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(lp, opts)
	    require('lualine').setup(opts)
    end
}
