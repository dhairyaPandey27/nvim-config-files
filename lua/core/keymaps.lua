vim.keymap.set("i","jk","<Esc>",{ desc = "Exit insert mode" })

vim.keymap.set({'n','v','o'},"j","k", { desc = "Move up" })
vim.keymap.set({'n','v','o'},"k","j", { desc = "Move down" })

vim.keymap.set("n","<leader>h",":winc h<CR>", { desc = "Navigation left" })
vim.keymap.set("n","<leader>l",":winc l<CR>", { desc = "Navigation right" })

vim.keymap.set("n","<leader>e",":Neotree toggle left<CR>", { desc = "Toggle Explorer" })

vim.g.netrw_keepdir = 0
