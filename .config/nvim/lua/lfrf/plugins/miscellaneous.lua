-- miscellanous shit that don't need a lot of configuration

return {
	-- lua function that many plugins use
	{ "nvim-lua/plenary.nvim" },
	-- tmux and split window navigation
	{ "christoomey/vim-tmux-navigator" },
	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},
	-- CSV
	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = { "csv", "tsv" },
		init = function()
			-- Avoid updating the statusline value
			vim.g.disable_rainbow_statusline = 1
		end,
	},
	-- dressing
	{ "stevearc/dressing.nvim" },
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			float_opts = { border = "rounded" },
		},
		keys = { { "<A-t>", "<CMD>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "n", "t" } } },
	},
	-- Pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { check_ts = true, ignored_next_char = "" },
	},
	-- -- Comments
	{ "numToStr/Comment.nvim", config = true },
	-- Indentation
	{ "nmac427/guess-indent.nvim", config = true },
	-- (f-)Strings
	{ "axelvc/template-string.nvim", event = "InsertEnter", config = true },
	-- Surround
	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },

	----- Language Extensions
	-- Lua
	{ "folke/lazydev.nvim", ft = "lua", config = true },
	-- JSON
	{ "b0o/schemastore.nvim", lazy = true },
	-- brainfuck
	{
		"llathasa-veleth/vim-brainfuck",
	},
	-- smt2
	{
		"bohlender/vim-smt2",
	},
}
