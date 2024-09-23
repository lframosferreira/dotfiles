return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "→",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
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
					"ruff",
					"yamlls",
					"ruby_lsp",
					"zls",
					"taplo",
				},
				automatic_installation = true,
			})

			mason_tool_installer.setup({
				enusre_installed = {
					"prettier",
					"isort",
					"black",
					"clang-format",
					"stylua",
				},
			})
		end,
	},
}
