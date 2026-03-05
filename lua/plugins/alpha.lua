return {
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
}
