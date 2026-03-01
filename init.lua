-- ==========================================
--  INSTALL LAZY.NVIM (The Package Manager)
-- ==========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- ==========================================
-- ==========================================


-- ==========================================
-- Options - Basic Settings
-- ==========================================
vim.opt.clipboard = "unnamedplus"
-- ==========================================
-- ==========================================


-- ==========================================
--    INSTALL & LOAD ROSE-PINE
-- ==========================================
require("lazy").setup({
  {
	"christoomey/vim-tmux-navigator"
  },
  { 
    "rose-pine/neovim", 
    name = "rose-pine",
    priority = 1000, -- Load this before everything else
    config = function()
	    require("rose-pine").setup({
		    variant="moon",
		    styles={
			    transparency = true,
		    },
	    })
        vim.cmd("colorscheme rose-pine")
    end 
  },
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
})
-- ==========================================
-- ==========================================


-- ==========================================
--             KEY - BINDINGS
-- ==========================================
vim.g.mapleader=" "

vim.keymap.set("i","jk","<Esc>",{ desc = "Exit insert mode" })
vim.keymap.set({'n','v','o'},"j","k", { desc = "Move up" })
vim.keymap.set({'n','v','o'},"k","j", { desc = "Move down" })
vim.keymap.set("n","<leader>h",":winc h<CR>", { desc = "Navigtion left" })
vim.keymap.set("n","<leader>l",":winc l<CR>", { desc = "Navigtion right" })
