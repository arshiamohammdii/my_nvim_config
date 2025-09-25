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
