# 🧠 DevFlex Neovim Config

A handcrafted **Neovim configuration built from scratch**, focused on speed, simplicity, and productivity.  
Designed for **TypeScript**, **Vue 3**, and **Go** development under **Linux + tmux** workflow.

---

## ✨ Highlights

- ⚙️ Fully written in **Lua**
- 🧩 Modular structure — easy to read, extend, and maintain
- 🦾 Complete LSP, formatting, and autocompletion setup
- 💻 Seamless development experience for **Vue 3**, **TypeScript**, and **Go**
- 🎨 Custom UI with **Nightfox** (light theme)
- 🔍 **Telescope** for fuzzy search and file navigation
- 📂 **Neo-tree** for file management
- 🧱 **Mason** for installing and updating LSPs, formatters, and linters
- ⚡️ Tuned for a clean tmux + Neovim environment

---

## 📁 Directory Structure

```

~/.config/nvim
├── lua/
│   ├── core/
│   │   ├── init.lua          # General settings and options
│   │   ├── keymaps.lua       # Custom keybindings
│   │   └── options.lua       # Editor behavior
│   │
│   ├── extras/               # Optional additions and helpers
│   │   └── init.lua
│   │
│   ├── plugins/
│   │   ├── configs/          # Plugin-specific configurations
│   │   │   ├── bufferline.lua
│   │   │   ├── cmp.lua
│   │   │   ├── lualine.lua
│   │   │   ├── mason.lua
│   │   │   ├── neo-tree.lua
│   │   │   └── telescope.lua
│   │   └── init.lua
│   │
│   ├── ui/
│   │   ├── themes/
│   │   │   └── nightfox.lua  # Theme configuration
│   │   └── lsp.lua           # LSP UI tweaks
│   │
│   └── lsp.lua               # Main LSP configuration
│
├── init.lua                   # Entry point
└── lazy-lock.json             # Plugin lockfile (lazy.nvim)

````

---

## 🧩 Core Plugins

| Plugin | Purpose |
|--------|----------|
| `nvim-lspconfig` | Core LSP setup |
| `vtsls` | TypeScript + Vue language server |
| `mason.nvim` | LSP/DAP/formatter manager |
| `nvim-cmp` | Autocompletion engine |
| `neo-tree.nvim` | File explorer |
| `telescope.nvim` | Fuzzy finder |
| `bufferline.nvim` | Tabs and buffers |
| `lualine.nvim` | Statusline |
| `nightfox.nvim` | Theme |

---

## 🎨 UI / Experience

- Minimalist interface with Nightfox (light) theme  
- Rounded borders and smooth transitions  
- Consistent colors across plugins  
- Configured for distraction-free coding  

---

## 🧰 Commands

| Command | Description |
|----------|-------------|
| `:Mason` | Manage LSP servers and tools |
| `:LspInfo` | Show active LSPs |
| `:Telescope find_files` | Search files |
| `:NeoTreeFocusToggle` | Toggle file tree |
| `:Format` | Format buffer |

---

## 💡 Philosophy

This setup is intentionally simple — no frameworks, no presets, no layers of abstraction.  
Every file and setting is explicit, predictable, and easy to reason about.  
It’s a **developer’s tool**, not a black box — optimized for clarity and control.

---

## 🧑‍💻 Author

**Pavel Sanikovich**  
Linux / tmux / Neovim enthusiast  
Specialized in Go, TypeScript, Vue 3, and Kafka systems.

---

## ⚙️ Installation

```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
nvim
````

---

## License

MIT © Pavel Sanikovich

