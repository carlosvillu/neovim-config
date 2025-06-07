# Carlos Villullas's NeoVim Configuration

A complete NeoVim configuration with a focus on development productivity, UI enhancements, and efficient keymappings. This setup provides a modern code editing experience with LSP support, autocompletion, formatting, and much more.

## Overview

This NeoVim configuration uses:
- [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management
- Modular organization in `lua/carlosvillu/`
- Extensive plugin customization for development workflows
- Spanish-friendly keymappings for common operations

## Features

### Core

- Space as leader key
- Relative line numbers with absolute on current line
- 2-space indentation with smart tab behavior
- System clipboard integration
- Dark theme with termguicolors
- Split behavior (right and below)
- No swap files

### Essential Keymaps

- `jk` to exit insert mode
- `<leader>nh` to clear search highlights
- `<leader>sv/sh` to split windows vertically/horizontally
- `<leader>sx` to close current split
- `<leader>to/tx` to open/close tabs
- `<Alt-c/v>` for system clipboard yank/paste
- `<Ctrl-j/k>` to move lines up/down
- Visual mode maintains selection after indenting
- `<leader>k` to replace word under cursor
- `<leader>cp/cr/cf/cd` to copy various file paths

### Plugins

#### Editor Interface
- **alpha-nvim**: Beautiful dashboard with quick actions
- **bufferline**: Tab/buffer management
- **lualine**: Status line with mode-based colors
- **nvim-tree**: File explorer (`<leader>ee` to toggle)
- **which-key**: Keybinding helper
- **dressing.nvim**: Improved UI for inputs
- **vim-maximizer**: Window maximization (`<leader>sm`)
- **indent-blankline**: Visual indentation guides

#### Language & Syntax
- **nvim-treesitter**: Advanced syntax highlighting
- **trouble.nvim**: Diagnostics viewer
- **todo-comments**: Highlight and navigate TODOs

#### LSP & Completion
- **mason.nvim**: LSP server manager
- **nvim-lspconfig**: LSP configuration
- **nvim-cmp**: Autocompletion engine
- **codeium.nvim**: AI code completion

#### Code Manipulation
- **conform.nvim**: Code formatting with formatter auto-selection
- **nvim-lint**: Linting with linter auto-selection
- **Comment.nvim**: Smart code commenting
- **nvim-surround**: Text object surrounding
- **nvim-autopairs**: Auto-close brackets and quotes
- **substitute.nvim**: Enhanced substitution

#### Search & Navigation
- **telescope.nvim**: Fuzzy finder for files and text

#### Git Integration
- **gitsigns.nvim**: Git status in gutter
- **lazygit.nvim**: Git UI integration

#### Session Management
- **auto-session**: Session saving and restoration

## Installation

1. Ensure you have NeoVim 0.9+ installed
2. Clone this repository to your NeoVim config directory:
   ```
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```
3. Start NeoVim and lazy.nvim will automatically install all plugins

## Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/carlosvillu/
│   ├── core/               # Core configuration
│   │   ├── init.lua
│   │   ├── keymaps.lua     # Key mappings
│   │   └── options.lua     # NeoVim options
│   ├── lazy.lua            # Plugin manager setup
│   └── plugins/            # Plugin configurations
│       ├── lsp/            # LSP configurations
│       │   ├── lspconfig.lua
│       │   └── mason.lua
│       └── ... (individual plugin files)
```

## Languages Supported

LSP, linting, and formatting support for:
- JavaScript/TypeScript
- HTML/CSS
- Lua
- Python
- Svelte
- GraphQL
- And many more via Mason

## Customization

To customize this configuration:
1. Modify options in `lua/carlosvillu/core/options.lua`
2. Change keymaps in `lua/carlosvillu/core/keymaps.lua`
3. Add or modify plugins in `lua/carlosvillu/plugins/`

## Credits

This configuration is inspired by various NeoVim setups in the community and continuously evolves to incorporate best practices.