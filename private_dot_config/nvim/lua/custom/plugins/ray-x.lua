return {
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
},
	-- shortcuts for ray-x
	vim.api.nvim_set_keymap("n", "<leader>ggi", ":GoImports<CR>", { silent = true, noremap = true }),
	vim.api.nvim_set_keymap("n", "<leader>ggf", ":GoFmt<CR>", { silent = true, noremap = true }),
	vim.api.nvim_set_keymap("n", "<leader>gge", ":GoIfErr<CR>", { silent = true, noremap = true })
