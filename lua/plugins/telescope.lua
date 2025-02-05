-- change some telescope options and a keymap to browse plugin files
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
      { '<leader>/', false },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "live grep",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- {
      --   "<leader>fn",
      --   function()
      --     require("telescope").extensions.notify.notify()
      --   end,
      --   desc = "Show notify history",
      -- },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
