local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Theme
  use {
    'catppuccin/nvim',
    branch = 'main',
    as = 'catppuccin'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      vim.cmd("TSUpdate")
      vim.cmd("TSInstall rust typescript bash ruby go json")
    end
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    run = function()
      vim.cmd("CocInstall coc-tsserver coc-json coc-html coc-css coc-rust-analyzer coc-snippets")
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
