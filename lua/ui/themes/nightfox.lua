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

  vim.cmd("colorscheme nightfox")
  -- Bufferline стили под dawnfox
end

return M
