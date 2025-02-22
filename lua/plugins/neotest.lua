return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest", -- Адаптер для Jest
    { "fredrikaverpil/neotest-golang", version = "*" },
  },
  opts = function(_, opts)
    opts.adapters = {
      require("neotest-jest")({
        jestCommand = "yarn tests --",
        jestConfigFile = "jest.config.js",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }),
      require("neotest-golang")(opts), -- Registration
    }
  end,
}
