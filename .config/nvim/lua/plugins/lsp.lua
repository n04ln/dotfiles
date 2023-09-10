local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	-- format on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				-- vim.lsp.buf.formatting_seq_sync()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- NOTE: Plz settings when add LSP
lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
