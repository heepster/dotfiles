return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
    },
    opts = {
      window = {
        mappings = {
          ["<esc>"] = "clear_filter",
        },
      },
    },
  },
}
