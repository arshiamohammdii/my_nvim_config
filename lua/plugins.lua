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
  
-- plugins.lua

-- { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons",
--   config = function()
--     require("bufferline").setup {}
--     vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
--     vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
--   end
-- },

  --harpoon 
  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
    vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end, { desc = "Harpoon next" })
    vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end, { desc = "Harpoon next" })
    vim.keymap.set("n", "<C-k><C-k>", function() harpoon:list():clear() end, { desc = "Harpoon next" })
    vim.keymap.set("n", "<C-k>", function() harpoon:list():remove() end, { desc = "Harpoon next" })
  end
  },


  -- Git
{ "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gdiffsplit", "Gblame" },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>",                       desc = "Fugitive status" },
    { "<leader>gc", "<cmd>Git commit<CR>",                desc = "Commit" },
    { "<leader>gp", "<cmd>Git push<CR>",                  desc = "Push" },
    { "<leader>gP", "<cmd>Git pull --rebase<CR>",         desc = "Pull --rebase" },
    { "<leader>gb", "<cmd>Gblame<CR>",                    desc = "Blame" },
    { "<leader>gd", "<cmd>Gdiffsplit<CR>",                desc = "Diff split" },
    -- optional convenience:
    { "<leader>ga", "<cmd>Git add .<CR>",                 desc = "Stage all (git add .)" },
    { "<leader>gcm","<cmd>Git commit -m ''<Left><Left><CR>",  desc = "Commit with message" },
  },
  event = "VeryLazy",
},

{ "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<CR>",         desc = "Diffview open" },
    { "<leader>dx", "<cmd>DiffviewClose<CR>",        desc = "Diffview close" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<CR>",desc = "File history (current)" },
    { "<leader>dH", "<cmd>DiffviewFileHistory<CR>",  desc = "Repo history" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
},
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
require("gitsigns").setup(
