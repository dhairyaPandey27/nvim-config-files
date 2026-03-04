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
  'goolord/alpha-nvim',
  config = function ()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
          [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
          [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
          [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
          [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
          [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
          [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
          [[                                                    ]],
          [[                D A N Z A   K U D O R O              ]],
      }

      -- Set Horizontal Alignment
      dashboard.section.header.opts.position = "center"

      -- Vertical Centering Logic
      -- This calculates the middle based on terminal height
      local function get_padding()
          local stats = vim.api.nvim_list_uis()[1]
          local height = stats and stats.height or 24
          -- Subtract the height of the logo (approx 8 lines) and divide by 2
          local padding_val = math.floor((height / 2) - 4)
          return { type = "padding", val = math.max(padding_val, 0) }
      end

      -- Disable buttons and footer for absolute minimalism
      dashboard.section.buttons.val = {}
      dashboard.section.footer.val = {}

      -- Combine everything
      dashboard.config.layout = {
          get_padding(),
          dashboard.section.header,
      }

      alpha.setup(dashboard.config)
  end
},
  { 
    "rose-pine/neovim", 
    name = "rose-pine",
    priority = 1000, 
    config = function()
	    require("rose-pine").setup({
		    variant="moon",
		    styles={
			    transparency = true,
		    },
                    palette = {
			    moon={
				    base = "#000000",

			    },
	                    main={
				    base = "#000000",

			    },
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
      "nvim-tree/nvim-web-devicons", 
    },
    lazy = false, 
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
vim.keymap.set("n","<leader>e",":Neotree toggle left<CR>", { desc = "Toggle Explorer" })
-- Automatically update the current working directory when you move in the explorer
vim.g.netrw_keepdir = 0
