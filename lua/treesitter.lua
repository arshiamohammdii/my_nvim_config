require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "python", "lua", "bash", "json", "yaml", "markdown", "vim", "vimdoc" },
  highlight = { enable = true },
  indent = { enable = true },
})
