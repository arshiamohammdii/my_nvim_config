local function create_file(args)
  local count = 0
  for arg in string.gmatch(args.args, "%S+") do
    count = count + 1
  end
  if count > 1 then
    vim.api.nvim_err_writeln("Arguments cannot be more than one!!!!")
    return
  end

  local path = args.args
  local dir = vim.fn.fnamemodify(path, ":h")
  vim.fn.mkdir(dir, "p")
  vim.fn.writefile({}, path)
  vim.cmd("edit " .. path)
  print("Created file:", path)
end

vim.api.nvim_create_user_command(
  "Create",
  create_file,
  {
    nargs = "+",
    desc = "create file command",
    complete = "dir"
  }
)



local function wrap_visual_mode()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
 local start_line, start_col = start_pos[1], start_pos[2]
    local end_line, end_col     = end_pos[1], end_pos[2]

    -- pull the lines out of the buffer
    local lines = vim.api.nvim_buf_get_text(
        0,
        start_line - 1,
        start_col,
        end_line - 1,
        end_col + 1,
        {}
    )

    local result = table.concat(lines, "\n")
    print(result)
end


vim.keymap.set("v", "<leader>x", function()
  print("PRINT VISUAL MODE FILREDDDFSDFSDFSDF")
  wrap_visual_mode()
end, { noremap = true, silent = false })
