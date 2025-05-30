return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint", "eslint_d" },
			typescript = { "eslint", "eslint_d" },
			python = { "mypy", "ruff" },
			c = { "clangtidy" },
			cpp = { "clangtidy" },
			-- rust = { "clippy" },
			lua = { "luacheck" },
			markdown = { "markdownlint" },
			json = { "jsonlint" },
			go = { "golangcilint" }
		}

		-- to remove warnings in js files
		lint.linters.eslint_d.args = {
			"--no-warn-ignored", -- <-- this is the key argument
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		-- to remove de global vim warning
		lint.linters.luacheck = {
			name = "name",
			cmd = "luacheck",
			stdin = true,
			args = {
				"--globals",
				"vim",
				"lvim",
				"reload",
				"--",
			},
			stream = stdout,
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "luacheck",
			}),
		}

		-- to prevent exit code 5
		lint.linters.golangcilint.args = {
			"run",
			"--output.json.path=stdout",
			"--show-stats=false",
			"--issues-exit-code",
			"0",
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
