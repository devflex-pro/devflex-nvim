local M = {}

M.setup = function()
  local ok, bufferline = pcall(require, "bufferline")
  if not ok then return end

  bufferline.setup({
    options = {
      numbers = "ordinal",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = { style = "icon" },
      buffer_close_icon = "",
      modified_icon = "●",
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
    },
  })
end

return M
