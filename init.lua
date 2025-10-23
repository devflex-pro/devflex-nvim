require "core"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.notify("lazy.nvim не установлен!", vim.log.levels.WARN)
  return
end
vim.opt.rtp:prepend(lazypath)

-- Устанавливаем прокси, если нет в окружении
vim.env.https_proxy = vim.env.https_proxy or "http://user238444:51bv6s@163.5.240.179:7541"
vim.env.http_proxy  = vim.env.http_proxy  or "http://user238444:51bv6s@163.5.240.179:7541"

-- После этого можно подключать свои плагины
require("plugins")

