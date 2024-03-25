local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    yaml = { "yamlfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    black = {
      prepend_args = { "--line-length=79" },
    },
  },
}

require("conform").setup(options)
