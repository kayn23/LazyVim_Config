return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      stylelint_lsp = function(_, opts)
        opts.filetypes = { "css", "scss", "less", "sass" }
      end,
    },
  },
}
