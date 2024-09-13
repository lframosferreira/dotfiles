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
					"ts_ls",
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
					"taplo",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local lspconfig = require("lspconfig")
			-- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = { Lua = { hint = { enable = true } } },
			})

			-- typescript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- yaml
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			-- rust
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

			-- python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- latex
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})

			-- json
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			-- toml
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})

			-- c/c++
			lspconfig.clangd.setup({
				cmd = { "clangd", "--completion-style=detailed" },
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })
				end,
			})

			-- bash
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
