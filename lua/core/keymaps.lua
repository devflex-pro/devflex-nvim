-- ~/.config/nvim/lua/core/keymaps.lua
local opts = { noremap = true, silent = true }

-- Лидер
vim.g.mapleader = " "


-- Таблица хоткеев
local keymaps = {
  n = { -- нормальный режим
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<leader>fw"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
    ["<Esc>"]      = { "<cmd>nohlsearch<CR>", "Clear search highlight" },
    ["<leader>e"]  = { ":Neotree toggle<CR>", "Open file tree" },
    ["<leader>w"]  = { ":w<CR>", "Save file" },
    ["<leader>q"]  = { ":q<CR>", "Quit" },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["gd"]         = { vim.lsp.buf.definition, "Go to definition" },
    ["gr"]         = { vim.lsp.buf.references, "References" },
    ["K"]          = { vim.lsp.buf.hover, "Hover doc" },
    --diagnostic list
    ["<leader>dl"] = { "<cmd>lua vim.diagnostic.setloclist({open=true})<CR>", "Open diagnostics in location list" },
    -- Bufferline / буферы
    ["<leader>bh"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
    ["<leader>bl"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
    ["<Tab>"]      = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
    ["<S-Tab>"]    = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
    -- close buffers
    ["<leader>bd"] = { "<cmd>BufferLinePickClose<CR>", "Pick buffer to close" },
    ["<leader>bc"] = { "<cmd>bdelete<CR>", "Close current buffer" },

    ["<leader>bo"] = {
      function()
        local current = vim.api.nvim_get_current_buf()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end,
      "Close other buffers",
    },
    ["<leader>sv"] = { "<cmd>vsplit<CR>", "Vertical split" },
    ["<leader>sh"] = { "<cmd>split<CR>", "Horizontal split" },
    ["<leader>sc"] = { "<cmd>close<CR>", "Close split" },
    ["<C-Up>"]     = { "<cmd>resize -2<CR>", "Resize split up" },
    ["<C-Down>"]   = { "<cmd>resize +2<CR>", "Resize split down" },
    ["<C-Left>"]   = { "<cmd>vertical resize -2<CR>", "Resize split left" },
    ["<C-Right>"]  = { "<cmd>vertical resize +2<CR>", "Resize split right" },
    ["<leader>se"] = { "<cmd>wincmd =<CR>", "Equalize splits" },
    ["<C-h>"]      = { "<C-w>h", "Window left" },
    ["<C-l>"]      = { "<C-w>l", "Window right" },
    ["<C-j>"]      = { "<C-w>j", "Window down" },
    ["<C-k>"]      = { "<C-w>k", "Window up" },
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
