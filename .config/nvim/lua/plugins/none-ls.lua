return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {

				-- Lua
				null_ls.builtins.formatting.stylua,

				-- JS/TS
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.formatting.eslint"),

				-- C/C++
				null_ls.builtins.formatting.clang_format,

				-- Python
				require("none-ls.formatting.ruff"),
				require("none-ls.diagnostics.ruff"),

				-- LaTeX
				require("none-ls.formatting.latexindent"),
			},
			debug = true,
		})
		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
