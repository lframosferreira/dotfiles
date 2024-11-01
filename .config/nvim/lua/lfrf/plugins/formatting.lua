return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile", "LspAttach", "BufWritePre" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "beautysh" },
				markdown = { "injected", "markdownlint" },
				yaml = { "prettier" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				http = { "injected" },
				json = { "jq" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				latex = { "latexindent" },
				zig = { "zigfmt" },
				toml = { "taplo" },
				html = { "htmlbeautifier" }
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set(
			{
				"n",
				"v",
			},
			"<leader>fm",
			function()
				conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
			end,
			{ desc = "Format file or range(in visual mode)" }
		)
	end,
}
