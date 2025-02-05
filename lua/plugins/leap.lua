return {
  "ggandor/leap.nvim",
  keys = {

    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
    { "gs", mode = { "n", "x", "o" }, false },
    -- {"<leader>ch", "<Plug>"}
    {
      "<leader>fu",
      mode = { "n", "x", "o" },
      "<Plug>(leap)",
      desc = "Leap",
    },
    { "<leader>cU", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
  },
}
