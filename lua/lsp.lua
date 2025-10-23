local vue_language_server_path = vim.fn.stdpath('data') ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

-- Vue Plugin для vtsls
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
  enableForWorkspaceTypeScriptVersions = true,   -- 👈 важно
}

local lspconfig = require("lspconfig")

lspconfig.vtsls.setup({
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript", "javascriptreact", "typescript",
    "typescriptreact", "typescript.tsx", "vue",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = { vue_plugin },
      },
    },
  },
  root_dir = lspconfig.util.root_pattern(
    "tsconfig.json", "jsconfig.json", "package.json", ".git"
  ),
})
