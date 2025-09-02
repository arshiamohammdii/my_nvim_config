local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })


-- Telescope Git pickers
-- vim.keymap.set("n", "<leader>gsu", require("telescope.builtin").git_status,   { desc = "Git status (Telescope)" })
-- vim.keymap.set("n", "<leader>gco", require("telescope.builtin").git_commits,  { desc = "Git commits (repo)" })
-- vim.keymap.set("n", "<leader>gcb", require("telescope.builtin").git_bcommits, { desc = "Git commits (buffer)" })
-- vim.keymap.set("n", "<leader>gbb", require("telescope.builtin").git_branches, { desc = "Git branches" })
