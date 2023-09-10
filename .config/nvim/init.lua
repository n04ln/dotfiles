require("plugins.plugin")

vim.scriptencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.showmatch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 3
vim.cmd.colorscheme "catppuccin"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"

vim.api.nvim_set_keymap("n", "<SPACE>q", "<CMD>q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<SPACE>w", "<CMD>w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<SPACE>", "<NOP>", { noremap = true })
function show_current_bufname()
	print(vim.api.nvim_buf_get_name(0))
end

vim.api.nvim_set_keymap("n", "Bn", "<CMD>lua show_current_bufname()<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-w><C-j>", "<C-w>+<C-x>", {})
vim.api.nvim_set_keymap("n", "<C-w><C-k>", "<C-w>-<C-x>", {})
vim.api.nvim_set_keymap("n", "<C-w><C-l>", "<C-w>><C-x>", {})
vim.api.nvim_set_keymap("n", "<C-w><C-h>", "<C-w><<C-x>", {})
vim.api.nvim_set_keymap("n", "<C-x><C-j>", "<C-w>+<C-x>", {})
vim.api.nvim_set_keymap("n", "<C-x><C-k>", "<C-w>-<C-x>", {})
vim.api.nvim_set_keymap("n", "<C-x><C-l>", "<C-w>><C-x>", {})
vim.api.nvim_set_keymap("n", "<C-x><C-h>", "<C-w><<C-x>", {})

vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<ESC><ESC>", "<CMD>noh<CR>", { noremap = true })
