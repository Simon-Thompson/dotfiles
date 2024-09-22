return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    keys = {
        { "<leader>ft", ":NvimTreeToggle<CR>", desc="file tree" },
        { "<leader>f.", ":NvimTreeFindFile<CR>", desc="file tree here" },
    }
}
