local M = {}

M.setup = function()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  -- функция для отображения имени активного LSP
  local function lsp_name()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(clients) == nil then
      return "[   No LSP ]"
    end

    local names = {}
    for _, client in ipairs(clients) do
      table.insert(names, client.name)
    end
    return "[ " .. "  " .. table.concat(names, "/") .. " ]"
  end

  lualine.setup {
    options = {
      theme = "auto", -- подхватывает текущий colorscheme
      icons_enabled = true,
      section_separators = { "", "" },
      component_separators = { "", "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype", lsp_name },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  }
end

return M
