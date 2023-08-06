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
        "codelldb",
        "golangci-lint-langserver",
        "go-debug-adapter",
        "golangci-lint",
        "goimports",
        "gopls",
        "helm-ls",
        "sqlls",
        "sqlfluff",
        "rubocop",
        "autopep8",
      },
    },
  },
}
