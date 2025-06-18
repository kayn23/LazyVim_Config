return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      stylelint_lsp = function(_, opts)
        opts.filetypes = { "css", "scss", "less", "sass" }
      end,
    },
    servers = {
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = false, -- Отключает автодобавление аргументов функций
            completeUnimported = true,
            staticcheck = true,
            hints = {
              parameterNames = false,
            },
          },
        },
      },
      ruby_lsp = {
        filetypes = { "ruby", "eruby", "rake", "jbuilder" },
      },
    },
  },
}
