return function()
  require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "single",
    window = {
      position = "float",
      width = 50,
      height = 25,
      mappings = {
        ["o"] = "open",
        ["<esc>"] = "close_window",
      },
    },
    filesystem = { filtered_items = { visible = true } },
  })
end
