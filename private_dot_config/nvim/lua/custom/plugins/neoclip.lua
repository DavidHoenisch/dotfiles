return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
		-- you'll need at least one of these
		-- {'nvim-telescope/telescope.nvim'},
		-- {'ibhagwan/fzf-lua'},
	},
	config = function()
		require("neoclip").setup()
	end,
},
	vim.api.nvim_set_keymap("n", "<leader>nc", ":Telescope neoclip<CR>", { silent = true, noremap = true }),
	vim.api.nvim_set_keymap("n", "<leader>ncm", ":Telescope macroscope<CR>", { silent = true, noremap = true })
