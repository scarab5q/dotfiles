local util = require("util")


-- Move to window using the movement keys
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")

-- change word with <c-c>
vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")

-- run lua
vim.keymap.set("n", "<leader>cR", util.runlua, { desc = "Run Lua" })

-- save file
vim.keymap.set("n", "<leader>fs", "<cmd>write<cr>", { desc = "[F]ile [S]ave" })


-- window management
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "move to the window on the left" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "move to the window on the right" })

vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "move to the window below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "move to the window above" })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

vim.keymap.set("n", "<leader>qq", "<cmd>qall<cr>", { desc = "Quit all windows" })

vim.keymap.set("n", ";", ":", { desc = "cmd" })
vim.keymap.set("n", ":", ";", { desc = "next f or t" })
return {}
