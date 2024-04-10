require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { noremap = true })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { noremap = true })
map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { noremap = true })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { noremap = true })
map("n", "<leader>dr", function()
  require("dapui").open { reset = true }
end, { noremap = true })

map("n", "<leader>fr", function()
  require("telescope.builtin").lsp_references()
end, { noremap = true, desc = "Telescope find code references" })
map("n", "<leader>b", function()
  require("telescope.builtin").buffers {
    sort_mru = true,
    ignore_current_buffer = true,
  }
end, { noremap = true, desc = "Telescope open buffers" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
