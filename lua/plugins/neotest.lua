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
      ["neotest-rspec"] = {
        -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
        rspec_cmd = function()
          return vim.tbl_flatten({
            "bundle",
            "exec",
            "rspec",
            "--format",
            "json",
            "--out",
            vim.fn.stdpath("data") .. "/rspec_output.json",
          })
        end,
      },
    }
    opts.log_level = vim.log.levels.DEBUG
  end,
}
