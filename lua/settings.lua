local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 200
opt.signcolumn = "yes"
vim.opt.incsearch = true   -- highlight while typing search
vim.opt.hlsearch = false   -- don't keep highlights after

-- Autoformat Go files before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Show diagnostics automatically on hover
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
