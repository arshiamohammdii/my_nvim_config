-- existing quick maps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics float" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Go: run module main (keep this whole function self-contained)
vim.keymap.set("n", "<leader>rm", function()
  local gomod = vim.fn.systemlist("go env GOMOD")[1]
  if not gomod or gomod == "" then return print("No go.mod found in this project.") end
  local root = vim.fn.fnamemodify(gomod, ":h")
  local results = vim.fn.systemlist("find " .. vim.fn.shellescape(root) .. " -type f -name main.go 2>/dev/null")
  if #results == 0 then return print("No main.go found in module.") end
  local main_path = results[1]
  local cmd = "!" .. "cd " .. vim.fn.shellescape(root) .. " && go run " .. vim.fn.shellescape(main_path)
  vim.cmd(cmd)
end, { desc = "Run Go main.go (auto-detect) from module root" })

-- === Git keymaps (top-level, executed on load) ===
local map = vim.keymap.set
local function opts(desc) return { noremap = true, silent = true, desc = desc } end

----[[   ]]Gitsigns
map("n", "]h", function() require("gitsigns").next_hunk() end, opts("Next hunk"))
map("n", "[h", function() require("gitsigns").prev_hunk() end, opts("Prev hunk"))
map("n", "<leader>hs", function() require("gitsigns").stage_hunk() end, opts("Stage hunk"))
map("n", "<leader>hr", function() require("gitsigns").reset_hunk() end, opts("Reset hunk"))
map("v", "<leader>hs", function()
  require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opts("Stage selection"))
map("n", "<leader>hS", function() require("gitsigns").stage_buffer() end, opts("Stage buffer"))
map("n", "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, opts("Undo stage hunk"))
map("n", "<leader>hR", function() require("gitsigns").reset_buffer() end, opts("Reset buffer"))
map("n", "<leader>hp", function() require("gitsigns").preview_hunk() end, opts("Preview hunk"))
map("n", "<leader>hb", function() require("gitsigns").blame_line({ full = true }) end, opts("Blame line"))
map("n", "<leader>htb", function() require("gitsigns").toggle_current_line_blame() end, opts("Toggle blame"))
map("n", "<leader>htd", function() require("gitsigns").toggle_deleted() end, opts("Toggle deleted"))

-- Fugitive (fixed)
map("n", "<leader>gs", ":Git<CR>",          opts("Fugitive status"))
map("n", "<leader>gc", ":Git commit<CR>",   opts("Commit"))
map("n", "<leader>gp", ":Git push<CR>",     opts("Push"))
map("n", "<leader>gP", ":Git pull --rebase<CR>", opts("Pull --rebase"))
map("n", "<leader>gb", ":Gblame<CR>",       opts("Blame"))        -- Gblame exists
map("n", "<leader>gd", ":Gdiffsplit<CR>",   opts("Diff split"))   -- Gdiffsplit exists

-- Diffview
map("n", "<leader>dv", ":DiffviewOpen<CR>", opts("Diffview open"))
map("n", "<leader>dx", ":DiffviewClose<CR>", opts("Diffview close"))
map("n", "<leader>dh", ":DiffviewFileHistory %<CR>", opts("File history (current)"))
map("n", "<leader>dH", ":DiffviewFileHistory<CR>", opts("Repo history"))

-- Neogit
map("n", "<leader>gn", function() require("neogit").open({ kind = "replace" }) end, opts("Open Neogit"))
