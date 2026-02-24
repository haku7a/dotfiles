return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = {
        "ruff_fix",
        "ruff_organize_imports",
        "ruff_format",
      },
      lua = {
        "stylua",
      },
    },
    formatters = {
      stylua = {
        prepend_args = { "--indent-width", "2", "--indent-type", "Spaces" },
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
