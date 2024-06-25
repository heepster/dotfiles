-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		-- Set theme
		{
			"projekt0n/github-nvim-theme",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme github_light]])
			end,
		},

		-- Sidebar
    {
		  "nvim-neo-tree/neo-tree.nvim",
		  branch = "v3.x",
		  dependencies = {
		  	"nvim-lua/plenary.nvim",
		  	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  	"MunifTanjim/nui.nvim",
		  	-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		  },
    }
	},

	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
