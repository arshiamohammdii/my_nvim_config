vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics float" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>rm", function()



  local gomod = vim.fn.systemlist("go env GOMOD")[1]
  if not gomod or gomod == "" then return print("No go.mod found in this project.") end
  local root = vim.fn.fnamemodify(gomod, ":h")
  local results = vim.fn.systemlist("find " .. vim.fn.shellescape(root) .. " -type f -name main.go 2>/dev/null")
  if #results == 0 then return print("No main.go found in module.") end
  local main_path = results[1]
  -- shell-escape everything; cd into module root; run it
  local cmd = "!" .. "cd " .. vim.fn.shellescape(root) .. " && go run " .. vim.fn.shellescape(main_path)
  vim.cmd(cmd)
end, { desc = "Run Go main.go (auto-detect) from module root" })
