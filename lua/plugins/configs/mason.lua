local M = {}

M.setup = function()
  -- Mason UI
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

  -- Mason + lspconfig интеграция
  local ok2, mason_lsp = pcall(require, "mason-lspconfig")
  if ok2 then
    mason_lsp.setup({
    })
  end
end

return M
