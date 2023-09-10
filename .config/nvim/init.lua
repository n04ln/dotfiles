require("plugins.plugin")

vim.scriptencoding = "utf-8"
vim.opt.number = true
-- vim.opt.background = "dark"
-- if vim.fn.has('termguicolors') == 1 then
--   vim.opt.termguicolors = true
-- end
-- vim.cmd[[colorscheme spacemacs-theme]]
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.showmatch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- vim.opt.undofile = true
-- vim.opt.undodir = "~/.vim/undo"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 3
vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_keymap("n", "<SPACE>q", "<CMD>q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<SPACE>w", "<CMD>w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<SPACE>", "<NOP>", { noremap = true })
function show_current_bufname()
	print(vim.api.nvim_buf_get_name(0))
end

vim.api.nvim_set_keymap("n", "Bn", "<CMD>lua show_current_bufname()<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>+", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>-", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>>", {})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w><", {})
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
