return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "pylint",
        "python-lsp-server",
        "rust-analyzer",
        "rustfmt",
        "codelldb",
      },
    },
  },
}
