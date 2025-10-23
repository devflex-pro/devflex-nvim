local M = {}

-- Настройка плагина
function M.setup()
  local ok, telescope = pcall(require, "telescope")
  if not ok then return end

  local actions = require("telescope.actions")
  local sorters = require("telescope.sorters")
  local previewers = require("telescope.previewers")

  local options = {
    defaults = {
      vimgrep_arguments = {
        "rg", "-L", "--color=never", "--no-heading",
        "--with-filename", "--line-number", "--column", "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = { prompt_position = "top", preview_width = 0.55 },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = sorters.get_fuzzy_file,
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      file_ignore_patterns = { "node_modules" },
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      buffer_previewer_maker = previewers.buffer_previewer_maker,
      mappings = {
        n = { ["q"] = actions.close },
      },
    },
    extensions_list = { "themes", "terms" },
  }

  telescope.setup(options)
end


return M

