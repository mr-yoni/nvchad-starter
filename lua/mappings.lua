require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)
map("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })
map("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
map("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
map("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>", { noremap = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
