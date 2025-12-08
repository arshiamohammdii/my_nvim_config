local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

vim.keymap.set("v", "<leader>7", function ()

  local visualMode = vim.fn.visualmode()

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")

  local start_row = start_pos[2] - 1
  local start_col = start_pos[3] - 1
  local end_row   = end_pos[2] - 1
  local end_col   = end_pos[3] - 1

  print(end_row, end_col)

  if visualMode == "v" then
    local text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col + 1, {})
    local surround_with = vim.fn.input("Surrond: ")

    local new = {}
    for _, line in ipairs(text) do
      local surrounded_line = string.format("%s(%s)", surround_with, trim(line))
      table.insert(new, surrounded_line)
    end

    vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col + 1, new)

  elseif visualMode == "V" then

    local text = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
    local surround_with = vim.fn.input("Surrond: ")

    local new = {}
    for _, line in ipairs(text) do
      local surrounded_line = string.format("%s(%s)", surround_with, trim(line))
      table.insert(new, surrounded_line)
    end

    vim.api.nvim_buf_set_lines(0, start_row, end_row + 1, false, new)
  end



  local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(key, 'n', false)

print("It worked!")

end)
