local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local vue_language_server_path = vim.fn.stdpath("data") ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
  enableForWorkspaceTypeScriptVersions = true,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.general = capabilities.general or {}
capabilities.general.positionEncodings = { "utf-16" }

local function is_vue_project(root_dir)
  return util.path.exists(util.path.join(root_dir, "vite.config.ts"))
      and (#vim.fn.glob(util.path.join(root_dir, "src/**/*.vue"), false, true) > 0)
      or util.path.exists(util.path.join(root_dir, "nuxt.config.ts"))
      or util.path.exists(util.path.join(root_dir, "nuxt.config.js"))
end

local function on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "<leader>fmi", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.addMissingImports.ts", "source.organizeImports.ts" },
        diagnostics = {},
      },
    })
  end, "Add missing imports / organize imports")

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

lspconfig.rubocop.setup({
  cmd = { "bundle", "exec", "rubocop", "--lsp" },
  filetypes = { "ruby" },
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.ruby_lsp.setup({
  cmd = { "bundle", "exec", "ruby-lsp" },
  filetypes = { "ruby", "eruby" },
  init_options = { formatter = "syntax_tree" },
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.vtsls.setup({
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = { vue_plugin },
      },
    },
    typescript = {
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
      preferences = {
        includePackageJsonAutoImports = "auto",
        quotePreference = "auto",
      },
      suggest = {
        completeFunctionCalls = true,
      },
      updateImportsOnFileMove = { enabled = "always" },
    },
    javascript = {
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
      preferences = {
        includePackageJsonAutoImports = "auto",
        quotePreference = "auto",
      },
      suggest = {
        completeFunctionCalls = true,
      },
      updateImportsOnFileMove = { enabled = "always" },
    },
  },
  root_dir = function(fname)
    local root = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname)
    if not root then
      return nil
    end

    if is_vue_project(root) then
      return root
    end

    return root
  end,
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.fixAll.eslint" },
            diagnostics = {},
          },
        })
      end,
    })
  end,
  settings = {
    workingDirectory = { mode = "auto" },
    format = true,
    codeActionOnSave = { enable = true, mode = "all" },
  },
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_dir = util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "package.json",
    ".git"
  ),
})

lspconfig.emmet_language_server.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "typescriptreact",
  },
})
