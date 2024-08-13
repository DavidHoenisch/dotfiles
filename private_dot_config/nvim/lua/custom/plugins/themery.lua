return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = { "tokyonight", "catppuccin", "gruvbox", "rose-pine" }, -- Your list of installed colorschemes
			livePreview = true, -- Apply theme while browsing. Default to true.
		})
	end,
}
