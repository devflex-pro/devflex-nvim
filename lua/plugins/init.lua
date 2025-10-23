require("lazy").setup({
  -- Плагины зависимостей
  { "nvim-lua/plenary.nvim" }, -- обязательно для Telescope/Neo-tree
  { "nvim-tree/nvim-web-devicons" },

  -- color theme
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    config = function()
      require("ui.themes.nightfox").setup()
    end,
  },
  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "EdenEast/nightfox.nvim" },
    lazy = false,
    config = function()
      require("plugins.configs.bufferline").setup()
    end,
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("plugins.configs.mason").setup()
    end,
  },
  -- Telescope для поиска файлов/текста
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.configs.telescope").setup()
    end,
  },
  -- Neo-tree для файлового дерева (float)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = function()
      require("plugins.configs.neo-tree")()
    end,
  },
  -- Treesitter для подсветки синтаксиса
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  -- LuaLine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.lualine").setup()
    end,
  },
  -- LSP и автокомплит (опционально)
  --
  --
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      vim.schedule(function()
        require("lsp") -- имя файла с настройками
      end)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function()
      require("plugins.configs.cmp").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "go",
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "vue",
          "html",
          "css",
          "json",
          "bash"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true, -- highlight non-bracket delimiters
        },
      })
    end
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",         -- для popup UI
      "nvim-lua/plenary.nvim",        -- утилиты и HTTP
      "nvim-telescope/telescope.nvim" -- уже у тебя есть
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY",
        openai_params = {
          model = "gpt-4o-mini",         -- лёгкая, быстрая и дешёвая модель
        },
        openai_proxy = "http://user238444:51bv6s@163.5.240.179:7541", -- 👈 твой прокси
        popup_input = {
          submit = "<C-Enter>",          -- отправка запроса
        },
      })
    end
  }

})
