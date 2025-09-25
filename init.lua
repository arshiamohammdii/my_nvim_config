-- Leader keys early
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load settings
require("settings")

-- Load plugins
require("plugins")

-- Load keymaps
require("keymaps")

-- Load LSP & completion
require("lsp")

-- Load Telescope config
require("telescope")

-- Load Treesitter config
require("treesitter")

-- Load Neo-tree config
require("neotree")

-- Load which-key groups
require("whichkey")

-- My Commands
require("commands")
