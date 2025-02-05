-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("custom.discipline")

-- discipline.cowboy()

local Util = require("lazyvim.util")
local map = vim.keymap.set
local del = vim.keymap.del
local set = Util.safe_keymap_set

map("n", "gh", vim.lsp.buf.hover, { desc = "Hover" })

-- Terminal

map("n", "<c-_>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = { position = "float" } })
end, { desc = "Terminal (Root Dir)" })

map("n", "<c-_>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = { position = "float" } })
end, { desc = "which_key_ignore" })

-- del("n", "<leader>wd")
-- map("n", "<leader>wc", "<C-W>c", { desc = "Delete window", remap = true })

-- del("n", "<leader><tab>d")
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- normal keymaps
-- del({ "n", "s", "x" }, "<Leader>ww")
map("n", "<Leader>ww", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "hover info on cursor" })
map("n", "<leader>uu", ":w<CR>")

-- insert keymaps

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

local cliff = require("cliff")
local opts = { noremap = true, silent = true, expr = true }
vim.keymap.set("n", "<c-j>", cliff.go_down, opts)
vim.keymap.set("n", "<c-k>", cliff.go_up, opts)
vim.keymap.set("v", "<c-j>", cliff.go_down, opts)
vim.keymap.set("v", "<c-k>", cliff.go_up, opts)
vim.keymap.set("o", "<c-j>", cliff.go_down, opts)
vim.keymap.set("o", "<c-k>", cliff.go_up, opts)

vim.keymap.set("n", "<leader>rn", ":IncRename ")

vim.keymap.set("n", "<leader>wl", "C-wv")

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cn", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "<leader>ch", diagnostic_goto(false), { desc = "Prev Diagnostic" })

map("n", "<leader-w>", "<cmd>w<cr><esc>")

vim.keymap.set("n", "<leader>yf", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  print("Copied relative path: " .. vim.fn.expand("%"))
end, { noremap = true, silent = true })
