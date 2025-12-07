vim.keymap.set("v", "<leader>7", function ()

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")

  local start_row = start_pos[2] - 1
  local start_col = start_pos[3] - 1
  local end_row   = end_pos[2] - 1
  local end_col   = end_pos[3] - 1

  print(end_row, end_col)

  local text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})


  local surround_with = vim.fn.input("Surrond: ")

  local new = {}
  for _, line in ipairs(text) do
    local surrounded_line = string.format("%s(%s)", surround_with, line)
    table.insert(new, surrounded_line)
  end

  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, new)


  local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(key, 'n', false)

print("It worked!")

end)


