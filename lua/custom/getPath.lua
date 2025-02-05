local M = {}

local function get_npm_global_path()
  local handle = io.popen("npm root -g")
  local result = handle:read("*a")
  handle:close()
  result = string.gsub(result, "[\r\n]+$", "")
  return result
end

M.get_vue_ls = function()
  local mason_registry = require("mason-registry")
  -- return mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"
  return "/Users/anatoly/.local/share/nvim/mason/packages/vue-language-server"
end

M.get_npm_global_path = get_npm_global_path

return M
