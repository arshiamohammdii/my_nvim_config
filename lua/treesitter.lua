require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "lua", "python", "bash", "json", "yaml", "markdown", "vim", "vimdoc" },
  highlight = { enable = true },
  indent = { enable = true },
})
