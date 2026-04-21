local M = {}

M.setup = function()
  local ok, mason = pcall(require, "mason")
  if ok then
    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
  end

  local ok2, mason_lsp = pcall(require, "mason-lspconfig")
  if ok2 then
    mason_lsp.setup({
      ensure_installed = {
        "vtsls",
        "eslint",
        "tailwindcss",
        "emmet_language_server",
        "lua_ls",
      },
      automatic_installation = true,
    })
  end
end

return M
