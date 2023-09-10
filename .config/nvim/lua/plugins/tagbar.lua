vim.keymap.set('n', 'tt', '<cmd>TagbarToggle<CR>')
vim.keymap.set('n', 'tc', '<cmd>TagbarCurrentTag<CR>')
vim.g.tagbar_ctags_bin = "/usr/local/Cellar/ctags/5.8_2/bin/ctags"
-- tagbar setting for golang. should install `gotags`
-- ref. https://github.com/jstemmer/gotags#vim-tagbar-configuration
vim.g.tagbar_type_go = {
	ctagstype  = "go",
	kinds      = {
		"p:package",
		"i:imports:1",
		"c:constants",
		"v:variables",
		"t:types",
		"n:interfaces",
		"w:fields",
		"e:embedded",
		"m:methods",
		"r:constructor",
		"f:functions"
	},
	sro        = ".",
	kind2scope = {
		t = "ctype",
		n = "ntype"
	},
	scope2kind = {
		ctype = "t",
		ntype = "n"
	},
	ctagsbin   = "gotags",
	ctagsargs  = "-sort -silent"
}
