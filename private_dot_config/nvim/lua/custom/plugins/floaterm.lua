return {
	"voldikss/vim-floaterm",
},
	vim.api.nvim_set_keymap("n", "<leader>ftn", ":FloatermNew<CR>", { silent = true, noremap = true }),
	vim.api.nvim_set_keymap("n", "<leader>fth", ":FloatermHide<CR>", { silent = true, noremap = true }),
	vim.api.nvim_set_keymap("n", "<leader>fts", ":FloatermShow<CR>", { silent = true, noremap = true })
