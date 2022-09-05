require("plugins")
require("lualine").setup {
  options = {
    theme = "tokyonight"
  }
}
require("lsp-config")
require("completion")
require("luasnip-config")
require("which-key-config")

-- TokyoNight config
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.opt.termguicolors = true
vim.cmd[[colorscheme tokyonight]]

-- General config
vim.opt.mouse = "a"
vim.opt.number = true
vim.g.mapleader = "<Space>"
vim.o.tabstop    = 2
vim.o.shiftwidth = 2
vim.o.expandtab  = true
-- don't want case sensitive searches
vim.o.ignorecase = true
-- but still want search to be smart. If i type a upper case thing, do a case
-- sensitive blah
vim.o.smartcase = true
