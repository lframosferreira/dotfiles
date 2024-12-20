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
	-- Peek
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			local peek = require("peek")
			peek.setup({
				auto_load = true, -- whether to automatically load preview when
				-- entering another markdown buffer
				close_on_bdelete = true, -- close preview window on buffer delete

				syntax = true, -- enable syntax highlighting, affects performance

				theme = 'dark', -- 'dark' or 'light'

				update_on_change = true,

				app = 'firefox', -- 'webview', 'browser', string or a table of strings
				-- explained below

				filetype = { 'markdown' }, -- list of filetypes to recognize as markdown

				-- relevant if update_on_change is true
				throttle_at = 200000, -- start throttling when file exceeds this
				-- amount of bytes in size
				throttle_time = 'auto', -- minimum amount of time in milliseconds
				-- that has to pass before starting new render
			})
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {});
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
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
	{ "numToStr/Comment.nvim",       config = true },
	-- Indentation
	{ "nmac427/guess-indent.nvim",   config = true },
	-- (f-)Strings
	{ "axelvc/template-string.nvim", event = "InsertEnter", config = true },
	-- Surround
	{ "kylechui/nvim-surround",      event = "VeryLazy",    config = true },

	----- Language Extensions
	-- Lua
	{ "folke/lazydev.nvim",          ft = "lua",            config = true },
	-- JSON
	{ "b0o/schemastore.nvim",        lazy = true },
	-- brainfuck
	{
		"llathasa-veleth/vim-brainfuck",
	},
	-- smt2
	{
		"bohlender/vim-smt2",
	},

	--lean
	{
		'Julian/lean.nvim',
		event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

		dependencies = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
			-- you also will likely want nvim-cmp or some completion engine
		},

		-- see details below for full configuration options
		opts = {
			lsp = {},
			mappings = true,
		}
	}
}
