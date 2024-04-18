# Neovim Config

*Created: February 26th, 2023*

## Getting Started

### Installation

1. Clone the git repository to the appropriate location. On Linux systems, this is `$XDG_CONFIG`, which on Ubuntu resolves to `~/.config/`. Note that you will need to alias the clone command.
```bash
git clone https://github.com/nickmarks00/neovim.git nvim
```
2. Open the newly-created NeoVim config directory - `vi nvim`. Since my config uses [Lazy](https://github.com/folke/lazy.nvim) as the package manager, it should be able to bootstrap itself and install all the necessary dependencies.
3. Ensure that all the proper language servers are installed. Since I am using Mason/LSP Zero, `ensure_installed` cannot be used to automatically install *all* of the LSPs I have configured. However, if you run `:Mason`, make sure the following are installed:
- For JS/HTML/CSS/React/etc.:
```
astro-language-server, biome, emmet-language-server, html-lsp, typescript-language-server, vue-language-server
```
- For Python:
```
black, debugpy, mypy, pylint, pyright, ruff, usort
```
- For Lua:
```
lua-language-server
```
- For C/C++:
```
clang-format, clangd, codelldb
```
- For Golang:
```
gofumpt, goimports-reviser, gopls
```
- For Rust:
```
rust-analyzer
```
- For LaTeX:
```
texlab
```
4. After this, you should be good to go!

## Configuration

As I add new plugins and options over time, I will add to this section of the documentation to describe how to interact with certain aspects of the config.
