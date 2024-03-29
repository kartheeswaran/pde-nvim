return {
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "VeryLazy",
    config = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    end,
  },
  {
    "simrat39/rust-tools.nvim",

    config = function()
      local rt = require("rust-tools")
      local mason_registry = require("mason-registry")

      local codelldb = mason_registry.get_package("codelldb")

      local extension_path = codelldb:get_install_path() .. "/extension"
      local codelldb_path = extension_path .. "/adapter/codelldb"

      local liblldb_path = extension_path .. "/lldb/lib/liblldb"
      local this_os = vim.loop.os_uname().sysname

      -- The path in windows is different
      if this_os:find("Windows") then
        codelldb_path = extension_path .. "\\adapter\\codelldb.exe"
        liblldb_path = extension_path .. "\\lldb\\bin\\liblldb.dll"
      else
        -- The liblldb extension is .so for linux and .dylib for macOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      rt.setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>dd", "<cmd>RustLastDebug<cr>")
          end,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      })
    end,
  },

  { "folke/neodev.nvim", opts = {} },
}
