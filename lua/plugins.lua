-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  
  -- Git
-- Fugitive
{ "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gdiffsplit", "Gblame" },
  -- also lazy-load on your keybindings:
  keys = {
    { "<leader>gs" }, { "<leader>gc" }, { "<leader>gp" },
    { "<leader>gP" }, { "<leader>gb" }, { "<leader>gd" },
  },
  event = "VeryLazy",
},

-- Diffview
{ "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>dv" }, { "<leader>dx" }, { "<leader>dh" }, { "<leader>dH" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
},
  { "tpope/vim-rhubarb", event = "VeryLazy" }, -- GitHub :Gbrowse support
  { "NeogitOrg/neogit", event = "VeryLazy", dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" } },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  -- { "junegunn/gv.vim", cmd = { "GV", "GV!" } },



  -- Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = { style = "night" } },

  -- UI
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "lewis6991/gitsigns.nvim" },
  { "folke/which-key.nvim", opts = {} },
  -- Editing helperdf
  { "numToStr/Comment.nvim", opts = {} },
  { "kylechui/nvim-surround", version = "*", opts = {} },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "MeanderingProgrammer/markdown.nvim", name = "render-markdown", ft = { "markdown" }, opts = {} },
  { "lukas-reineke/headlines.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }, ft = { "markdown" }, opts = {} },
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },

  -- LSP ecosystem
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
}, { ui = { border = "rounded" } })

-- Colorscheme
vim.cmd.colorscheme("tokyonight")

-- lualine
require("lualine").setup({ options = { theme = "auto" } })

-- gitsigns
require("gitsigns").setup()
