-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("custom.discipline")

discipline.cowboy()

local Util = require("lazyvim.util")
local map = vim.keymap.set
local del = vim.keymap.del

-- terminal
local lazyterm = function()
  Util.terminal(nil, {
    cwd = Util.root(),
    border = "double",
    size = { width = 0.7, height = 0.7 },
    title = "Terminal " .. Util.root(),
  })
end
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<c-/>")

map("n", "<leader>ft", lazyterm, { desc = "Open Terminal" })
map("n", "<c-/>", lazyterm, { desc = "Open Terminal" })

-- del("n", "<leader>wd")
-- map("n", "<leader>wc", "<C-W>c", { desc = "Delete window", remap = true })

-- del("n", "<leader><tab>d")
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- normal keymaps
map({ "n", "s", "x" }, "<Leader>ww", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "hover info on cursor" })

-- insert keymaps
map("i", "jj", "<esc>")

-- visual keymaps
map("v", "yy", '"+y')

-- comment line key binding
if Util.has("Comment.nvim") then
  map("n", "<Leader>/", function()
    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end, { desc = "Toggle comment line" })
  map(
    "v",
    "<Leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "Toggle comment for selection" }
  )
end
