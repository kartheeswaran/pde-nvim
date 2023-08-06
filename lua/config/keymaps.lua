-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- vim.keymap.set("n", "gf", tree, opts)

local tel_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>kf", tel_builtin.lsp_document_symbols, {})

vim.keymap.set("n", "<leader>kk", function()
  -- print("Karthee")
  -- print(vim.fn.line("."))
  local selected_word = vim.fn.expand("<cword>")
  -- READ
  --

  tel_builtin.grep_string({
    prompt_title = "Search : " .. selected_word,
    search = selected_word,
  })
end)

vim.keymap.set("n", "<leader>kc", function()
  -- print("Karthee")
  -- print(vim.fn.line("."))
  local selected_word = vim.fn.expand("<cword>")
  -- READ

  tel_builtin.find_files({
    prompt_title = "Search File : " .. selected_word,
    search_file = selected_word,
  })
end)

vim.keymap.set("n", "<leader>km", function()
  tel_builtin.lsp_document_symbols({})
end)
