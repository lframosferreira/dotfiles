return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"cssls",
					"rust_analyzer",
					"clangd",
					"texlab",
					"pylsp",
					"julials",
					"marksman",
					"zls",
					"prismals",
					"texlab",
					"bashls",
					"pyright",
					"jsonls",
					"ruff",
					"yamlls",
					"ruby_lsp",
					"zls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = { Lua = { hint = { enable = true } } },
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				cmd = { "clangd", "--completion-style=detailed" },
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })
				end,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
