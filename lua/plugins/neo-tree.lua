return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 25,
    },
  },
  keys = {
    {
      "<leader>o",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd("p")
        else
          vim.cmd.Neotree("focus")
        end
      end,
      desc = "Toggle Explorer focus",
    },
  },
}
