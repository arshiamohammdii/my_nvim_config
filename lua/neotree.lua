require("neo-tree").setup({
  sources = { "filesystem", "buffers", "git_status" },
  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = {
    hide_dotfiles = false,
    hide_gitignored = false,
  }, use_libuv_file_watcher = true,
  },
  window = {
    mappings = {
      ["t"] = "open_tabnew",
      ["R"] = "refresh",       -- uppercase R refresh (default)
    }
  },
  -- default_component_configs = {
  --   git_status = { symbols = { added = "A", modified = "M", deleted = "D", renamed = "R" } },
  -- },
})
