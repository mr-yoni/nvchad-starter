require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { noremap = true })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { noremap = true, desc = "Python DAP test method" })
map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { noremap = true, desc = "DAP UI toggle" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { noremap = true })
map("n", "<leader>dr", function()
  require("dapui").open { reset = true }
end, { noremap = true, desc = "DAP UI reset" })

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

local lsplinks = require "lsplinks"
vim.keymap.set("n", "gx", lsplinks.gx, { noremap = true, desc = "LspLinks open document link" })

local gitsigns = require "gitsigns"

-- map("n", "]c", function()
--   if vim.wo.diff then
--     vim.cmd.normal { "]c", bang = true }
--   else
--     gitsigns.nav_hunk "next"
--   end
-- end, { noremap = true, desc = "Gitsigns next hunk" })
--
-- map("n", "[c", function()
--   if vim.wo.diff then
--     vim.cmd.normal { "[c", bang = true }
--   else
--     gitsigns.nav_hunk "prev"
--   end
-- end, { noremap = true, desc = "Gitsigns prev hunk" })

-- Navigation
map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  else
    return "<cmd>Gitsigns next_hunk<CR>"
  end
end, { noremap = true, desc = "Gitsigns next hunk" })
map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  else
    return "<cmd>Gitsigns prev_hunk<CR>"
  end
end, { noremap = true, desc = "Gitsigns prev hunk" })
-- Actions
map("n", "<leader>hs", gitsigns.stage_hunk, { noremap = true, desc = "Gitsigns stage hunk" })
map("n", "<leader>hr", gitsigns.reset_hunk, { noremap = true, desc = "Gitsigns reset hunk" })
map("n", "<leader>hu", gitsigns.undo_stage_hunk, { noremap = true, desc = "Gitsigns undo stage hunk" })
map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { noremap = true, desc = "Gitsigns stage hunk" })
map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { noremap = true, desc = "Gitsigns reset hunk" })
map("n", "<leader>hS", gitsigns.stage_buffer, { noremap = true, desc = "Gitsigns stage buffer" })
map("n", "<leader>hR", gitsigns.reset_buffer, { noremap = true, desc = "Gitsigns reset buffer" })
map("n", "<leader>hp", gitsigns.preview_hunk, { noremap = true, desc = "Gitsigns preview hunk" })
map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end, { noremap = true, desc = "Gitsigns blame line" })
map(
  "n",
  "<leader>tb",
  gitsigns.toggle_current_line_blame,
  { noremap = true, desc = "Gitsigns toggle current line blame" }
)
map("n", "<leader>hd", gitsigns.diffthis, { noremap = true, desc = "Gitsigns diff this" })
map("n", "<leader>hD", function()
  gitsigns.diffthis "~"
end, { noremap = true, desc = "Gitsigns diff this ~" })
map("n", "<leader>td", gitsigns.toggle_deleted, { noremap = true, desc = "Gitsigns toggle deleted" })

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>h")
nomap("n", "<leader>v")
