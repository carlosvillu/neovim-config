return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	commit = "2b10c17c46e43154ebd058f6b3d3842dd8fa7cab",
	config = function()
		require("codeium").setup({
			-- Optionally disable cmp source if using virtual text only
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
			},
		})
	end,
}
