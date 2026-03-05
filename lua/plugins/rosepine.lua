return {
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
  }
