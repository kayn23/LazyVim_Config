return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 25,
      mappings = {
        ["l"] = "toggle_node",
        ["R"] = "expand_all_nodes",
        ["<leader>yn"] = function(state)
          local node = state.tree:get_node()
          if node then
            local filename_without_ext = vim.fn.fnamemodify(node.name, ":r")
            vim.fn.setreg("+", filename_without_ext)
            print("Скопировано в буфер обмена: " .. filename_without_ext)
          end
        end,
        ["<leader>yf"] = function(state)
          -- Копируем относительный путь файла
          local node = state.tree:get_node()
          if node then
            local relative_path = node.path -- Получаем путь к файлу
            vim.fn.setreg("+", relative_path)
            print("Скопировано в буфер обмена: " .. relative_path)
          end
        end,
      },
    },
    nesting_rules = {
      ["vue"] = {
        pattern = "(.*)%.vue$",
        files = { "%1.spec.ts", "%1.stub.ts" },
      },
      ["ts"] = {
        pattern = "(.*)%.ts$",
        files = { "%1.spec.ts", "%1.mock.ts" },
      },
      ["tsx"] = {
        pattern = "(.*)%.tsx$",
        files = { "%1.module.scss", "%1.spec.ts", "%1.spec.tsx", "%1.stories.ts", "%1.stories.tsx" },
      },
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
