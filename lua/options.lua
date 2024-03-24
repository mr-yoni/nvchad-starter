require "nvchad.options"

-- add yours here!
local g = vim.g
g.python3_host_prog = "~/.pyenv/versions/3.11.3/envs/neovim3/bin/python3"
g.loaded_python3_provider = 1

local o = vim.o
o.relativenumber = true -- Show line number and relative line number
-- o.cursorlineopt ='both' -- to enable cursorline!
