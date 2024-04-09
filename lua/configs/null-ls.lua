local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local ops = {
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black.with {
      extra_args = { "--line-length=100", "-tpy38", "-tpy39", "-tpy310", "-tpy311" },
    },
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.yamlfmt.with {
      extra_args = { "retain_line_breaks=true" },
    },
    null_ls.builtins.code_actions.gitsigns.with {
      config = {
        filter_actions = function(title)
          return title:lower():match "blame" == nil -- filter out blame actions
        end,
      },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return ops
