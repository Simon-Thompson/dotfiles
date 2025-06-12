-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.del("n", "gf")
-- vim.keymap.del("n", "gb")

-- Movement
vim.keymap.set("n", "gf", "<C-i>", { noremap = true, desc = "Jump Forward" })
vim.keymap.set("n", "gb", "<C-o>", { noremap = true, desc = "Jump Back" })

-- Buffers
vim.keymap.set("n", "<C-c>", ":bd<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
