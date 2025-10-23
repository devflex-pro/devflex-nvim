-- ~/.config/nvim/lua/core/keymaps.lua
local opts = { noremap = true, silent = true }

-- Лидер
vim.g.mapleader = " "


-- Таблица хоткеев
local keymaps = {
  n = { -- нормальный режим
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<leader>fw"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
    ["<leader>e"] = { ":Neotree toggle<CR>", "Open file tree" },
    ["<leader>w"] = { ":w<CR>", "Save file" },
    ["<leader>q"] = { ":q<CR>", "Quit" },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    --diagnostic list
    ["<leader>dl"] = { "<cmd>lua vim.diagnostic.setloclist({open=true})<CR>", "Open diagnostics in location list" },
    -- Bufferline / буферы
    ["<leader>bh"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
    ["<leader>bl"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
  },

  i = { -- вставка
    ["jj"] = { "<Esc>", "Exit insert mode" },
  },

  v = { -- визуальный режим
    ["<leader>c"] = { '"*y', "Copy to system clipboard" },
  },
}

-- Функция для установки keymaps из таблицы
for mode, maps in pairs(keymaps) do
  for lhs, rhs in pairs(maps) do
    local rhs_cmd = rhs[1]
    local desc = rhs[2] -- описание (можно использовать для which-key)
    vim.keymap.set(mode, lhs, rhs_cmd, vim.tbl_extend("force", opts, { desc = desc }))
  end
end
