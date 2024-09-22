return {
  "folke/zen-mode.nvim",
  opts = {
      width=150
  },
  keys = {
    { "<leader>z", function() require("zen-mode").toggle() end, desc="Zen mode" }
  }
}
