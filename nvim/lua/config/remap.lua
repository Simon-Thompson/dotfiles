vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc="Open file nav"})

-- I mess these up all the time
vim.keymap.set("n", ":WQ", ":wq")
vim.keymap.set("n", ":Wq", ":wq")
vim.keymap.set("n", ":W", ":w")
vim.keymap.set("n", ":Q", ":q")

-- Jump forward and back
vim.keymap.set("n", "gf", "<c-i>", {desc="Jump forward"})
vim.keymap.set("n", "gb", "<c-o>", {desc="Jump back"})
--
-- Switch buffers with tab
vim.keymap.set("n", "<tab>", ":bnext<cr>", {desc="Buffer next"})
vim.keymap.set("n", "<s-tab>", ":bprevious<cr>", {desc="Buffer prev"})
-- Close buffer
vim.keymap.set("n", "<c-c>", ":bd<cr>")

-- Move highlighted text around
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Append next line to this one while keeping cursor at current position
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page jumps centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Search centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", {desc="LSP restart"})

-- Keep the paste buffer when pasting over
vim.keymap.set("x", "<leader>p", [["_dP]], {desc="Paste"})

-- Yank outside of vim with <leader>y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc="Yank to system clipboard"})

-- tmux nav
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix nav
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc="Quickfix next"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc="Quickfix prev"})

-- Refactor in place
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc="Refactor in place"})
