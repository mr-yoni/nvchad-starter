---@type ChadrcConfig
local M = {}

-- prepend path with modern node for running nvim
vim.cmd 'let $PATH = "/Users/yonimadar/.nvm/versions/node/v20.15.0/bin:" . $PATH'

M.ui = {

  theme_toggle = { "catppuccin", "gruvbox_light" },
  theme = "catppuccin",
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
