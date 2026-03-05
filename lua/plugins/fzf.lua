return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            layout = "horizontal",
            ratio = 60,
          },
        },
      })

      -- Keymaps
      local keymap = vim.keymap.set
      keymap("n", "<leader>ff", fzf.files,                { desc = "Find files" })
      keymap("n", "<leader>fg", fzf.live_grep,            { desc = "Live grep" })
      keymap("n", "<leader>fb", fzf.buffers,              { desc = "Find buffers" })
      keymap("n", "<leader>fr", fzf.oldfiles,             { desc = "Recent files" })
      keymap("n", "<leader>fc", fzf.grep_cword,           { desc = "Find word under cursor" })
      keymap("n", "<leader>fd", fzf.diagnostics_document, { desc = "LSP diagnostics" })
      keymap("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Document symbols" })
      keymap("n", "<leader>fh", fzf.helptags,             { desc = "Help tags" })
      keymap("n", "<leader>gc", fzf.git_commits,          { desc = "Git commits" })
      keymap("n", "<leader>gb", fzf.git_branches,         { desc = "Git branches" })
    end,
  },
}
