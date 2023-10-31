return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
    end,
    keys = {
      {
        "-",
        "<cmd>Oil<cr>",
        desc = "Open Oil",
      },
      {
        "_",
        function()
          local oil = require("oil")
          oil.toggle_float(oil.get_current_dir())
        end,
        desc = "Popup Open Oil",
      },
    },
  },
}
