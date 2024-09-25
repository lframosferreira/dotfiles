return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

		-- Ensure NeoTree uses the same background (chatGPT said this)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "neo-tree",
			callback = function()
				vim.opt_local.winhighlight = "Normal:Normal,NormalNC:Normal"
			end,
		})
	end,
}
