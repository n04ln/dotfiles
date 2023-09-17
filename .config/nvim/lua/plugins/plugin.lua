local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup({
	-- COLORSCHEME
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- "colepeters/spacemacs-theme.vim",

	"preservim/nerdtree",

	-- LSP
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",

	-- COMPLETION
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/vim-vsnip",

	-- Syntax Highlight
	"nvim-treesitter/nvim-treesitter",

	"dyng/ctrlsf.vim",
	"ctrlpvim/ctrlp.vim",
	"cohama/lexima.vim",
	"tomtom/tcomment_vim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"majutsushi/tagbar",
	"Yggdroot/indentLine",
	"nvim-lualine/lualine.nvim",
	"goolord/alpha-nvim",
	"junegunn/fzf.vim",
	"junegunn/fzf",
	{
		"luckasRanarison/nvim-devdocs",
		opts = {}
	}
})

require("plugins.nerdtree")
require("plugins.mason")
require("plugins.catppuccin")
require("plugins.lsp")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")
require("plugins.lualine")
require("plugins.alpha")
require("plugins.tagbar")
require("plugins.nvim-devdocs")
require("plugins.ctrlsf")
require("plugins.fzf")
