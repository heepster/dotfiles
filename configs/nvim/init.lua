-- Entrypoint for Neovim Configuration

if vim.g.vscode then
  -- If I'm in VSCode, just load keybindings
  require("keys")
else
  -- otherwise, load keybindings and plugins
  require("keys")
  require("plugins")
end

