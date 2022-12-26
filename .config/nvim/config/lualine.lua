local winbar = require "config.winbar"

require("lualine").setup {
  options = {
    disabled_filetypes = {
      statusline = {},
      winbar = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
      },
    },
  },
  ...
  winbar = {
    lualine_a = { "diagnostics" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { winbar.get_winbar },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  ...
}
end
