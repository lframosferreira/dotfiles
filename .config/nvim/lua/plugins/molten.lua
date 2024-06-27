return {
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		ft = { "python", "julia" },
		init = function()
			vim.g.molten_tick_rate = 200
			vim.g.molten_auto_image_popup = true

			-- Output Window
			vim.g.molten_auto_open_output = false
			vim.g.molten_output_win_max_height = 30

			-- Virtual Text
			vim.g.molten_virt_text_output = true
		end,
		config = function()
			local keymap = vim.keymap.set
			keymap("n", "<localleader>e", "<CMD>MoltenEvaluateOperator<CR>", { desc = "Evaluate Operator" })
			keymap("n", "<localleader>l", "<CMD>MoltenEvaluateLine<CR>", { desc = "Evaluate Line" })
			keymap("n", "<localleader>r", "<CMD>MoltenReevaluateCell<CR>", { desc = "Re-evaluate cell" })
			keymap("n", "<localleader>d", "<CMD>MoltenDelete<CR>", { desc = "Delete cell" })
			keymap("n", "<localleader>s", "<CMD>MoltenEnterOutput<CR>", { desc = "Show/enter output window" })
			keymap("n", "<localleader>h", "<CMD>MoltenHideOutput<CR>", { desc = "Hide output window" })
			keymap("n", "]q", "<CMD>MoltenNext<CR>", { desc = "Goto next cell" })
			keymap("n", "[q", "<CMD>MoltenPrev<CR>", { desc = "Goto prev cell" })
			keymap("v", "<localleader>e", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Evaluate visual selection" })
		end,
	},
	{
		-- see the image.nvim readme for more information about configuring this plugin
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- whatever backend you would like to use
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
