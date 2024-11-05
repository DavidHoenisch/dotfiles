return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	opts = {
		-- Configuration here, or leave empty to use defaults
		line_offset = function(args)
			return args.line1
		end,
	},
	config = function()
		require("nvim-silicon").setup({
			font = "RecMono Linear Nerd Font=26",
			background = "#87f",
			theme = "Dracula",
		})
	end,
	init = function()
		local wk = require("which-key")
		wk.add({
			mode = { "v" },
			{ "<leader>s", group = "Silicon" },
			{
				"<leader>sc",
				function()
					require("nvim-silicon").clip()
				end,
				desc = "Copy code screenshot to clipboard",
			},
			{
				"<leader>sf",
				function()
					require("nvim-silicon").file()
				end,
				desc = "Save code screenshot as file",
			},
			{
				"<leader>ss",
				function()
					require("nvim-silicon").shoot()
				end,
				desc = "Create code screenshot",
			},
		})
	end,
}

-- return {
-- 	"krivahtoo/silicon.nvim",
-- 	run = "./install.sh build",
-- 	config = function()
-- 		require("silicon").setup({
-- 			line_number = true,
-- 			pad_vert = 80,
-- 			pad_horiz = 50,
-- 			window_title = function()
-- 				return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
-- 			end,
-- 		})
-- 	end,
-- }
