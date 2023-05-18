require("catppuccin").setup {
  flavor = "frappe",
  integrations = {
  },
  color_overrides = {
      all = {
          -- text = "#ffffff",
      },
      mocha = {
          -- flamingo = "#ffffff",
      }
  }
}
vim.cmd.colorscheme "catppuccin"