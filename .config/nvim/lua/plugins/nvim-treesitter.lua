require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
	},
}
