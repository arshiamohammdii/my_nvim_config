-- =========================================
-- Keymaps
-- =========================================

-- Helpers
local map = vim.keymap.set
local function nmap(lhs, rhs, desc) map("n", lhs, rhs, { noremap = true, silent = true, desc = desc }) end
local function vmap(lhs, rhs, desc) map("v", lhs, rhs, { noremap = true, silent = true, desc = desc }) end

local function imap(lhs, rhs, desc) map("i", lhs, rhs, { noremap = true, silent = true, desc = desc }) end



--Insert mode golang error
imap("<C-e>", "if err != nil {\n\t\n}<Esc>k$i", "Golang error handling")

-- Copy to clipboard in visual mode
vmap("<leader>yy", ":y+<CR>", "Copy To Clipboard")

-- =========================================
-- Quick actions
-- =========================================
nmap("<leader>e", vim.diagnostic.open_float, "Diagnostics float")
nmap("<leader>ww", ":w<CR>",                  "Save")
nmap("<leader>q", ":q<CR>",                  "Quit")
-- nmap("<leader>qq", ":qall<CR>",                  "Quit All")

nmap("<leader>yy", ":%y+<CR>", "Copy Whole File To Clipboard")
-- =========================================
-- Window navigation (Vim split movement)
-- =========================================
nmap("<leader>wh", "<C-w>h", "Move focus left")
nmap("<leader>wl", "<C-w>l", "Move focus right")
nmap("<leader>wj", "<C-w>j", "Move focus down")
nmap("<leader>wk", "<C-w>k", "Move focus up")

-- =========================================
-- Go: run module main (auto-detect)
-- =========================================
nmap("<leader>rm", function()
  local gomod = vim.fn.systemlist("go env GOMOD")[1]
  if not gomod or gomod == "" then
    print("No go.mod found in this project.")
    return
  end
  local root = vim.fn.fnamemodify(gomod, ":h")
  local results = vim.fn.systemlist(
    "find " .. vim.fn.shellescape(root) .. " -type f -name main.go 2>/dev/null"
  )
  if #results == 0 then
    print("No main.go found in module.")
    return
  end
  local main_path = results[1]
  local cmd = "!" .. "cd " .. vim.fn.shellescape(root) .. " && go run " .. vim.fn.shellescape(main_path)
  vim.cmd(cmd)
end, "Run Go main.go (auto-detect)")

-- =========================================
-- Git: gitsigns
-- =========================================
nmap("]h", function() require("gitsigns").next_hunk() end,               "Next hunk")
nmap("[h", function() require("gitsigns").prev_hunk() end,               "Prev hunk")
nmap("<leader>hs", function() require("gitsigns").stage_hunk() end,      "Stage hunk")
vmap("<leader>hs", function()
  require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, "Stage selection")
nmap("<leader>hS", function() require("gitsigns").stage_buffer() end,    "Stage buffer")
nmap("<leader>hu", function() require("gitsigns").undo_stage_hunk() end, "Undo stage hunk")
nmap("<leader>hr", function() require("gitsigns").reset_hunk() end,      "Reset hunk")
nmap("<leader>hR", function() require("gitsigns").reset_buffer() end,    "Reset buffer")
nmap("<leader>hp", function() require("gitsigns").preview_hunk() end,    "Preview hunk")
nmap("<leader>hb", function() require("gitsigns").blame_line({ full = true }) end, "Blame line")
nmap("<leader>htb", function() require("gitsigns").toggle_current_line_blame() end, "Toggle blame")
nmap("<leader>htd", function() require("gitsigns").toggle_deleted() end, "Toggle deleted")

-- =========================================
-- Git: Neogit (optional UI)
-- =========================================
nmap("<leader>gn", function() require("neogit").open({ kind = "replace" }) end, "Open Neogit")
