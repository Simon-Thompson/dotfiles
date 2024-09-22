return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    integrations = {
        mason = true,
        nvim_surround = true,
        which_key = true
    }
  }
}
