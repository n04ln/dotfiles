require('nvim-devdocs').setup({
	-- ...
	after_open = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', ':close<CR>', {})
	end
})
