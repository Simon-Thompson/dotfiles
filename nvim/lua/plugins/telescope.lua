local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    event = "VimEnter",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc="find files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc="find grep" },
        { "<leader><leader>", function() require("telescope.builtin").buffers() end, desc="find buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc="find help" },
    },
    defaults = {
        mappings = {
            i = {
                ['<CR>'] = select_one_or_multi,
            }
        }
    }
}
