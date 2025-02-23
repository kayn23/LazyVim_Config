return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {

    ---@type table<string, snacks.win.Config>
    styles = {
      notification = {
        wo = {
          wrap = true,
        },
      },
      notification_history = {
        wo = {
          wrap = true,
        },
      },
      -- your styles configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
