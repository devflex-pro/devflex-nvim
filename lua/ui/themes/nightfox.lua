local M = {}

M.setup = function()
  -- Загружаем тему dawnfox
  local ok, nightfox = pcall(require, "nightfox")
  if not ok then
    return
  end

  nightfox.setup({
    options = {
      transparent = false,
      styles = {
        comments = "italic",
        keywords = "bold",
        -- и др.
      },
    },
  })

  vim.cmd("colorscheme dayfox")
  vim.cmd([[highlight Normal guibg=#f5efe0]])
  vim.cmd([[highlight NormalFloat guibg=#f5efe0]])
  -- Bufferline стили под dawnfox
end

return M
