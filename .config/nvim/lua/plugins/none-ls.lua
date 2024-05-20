return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- General
                null_ls.builtins.formatting.prettier,

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- JS/TS
                require("none-ls.diagnostics.eslint_d"),
                require("none-ls.formatting.eslint"),

                -- C/C++
                null_ls.builtins.formatting.clang_format,

                -- Python
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
                require("none-ls.diagnostics.flake8"),

                -- LaTeX
                require("none-ls.formatting.latexindent"),
            },
            debug = true,
        })
        vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
    end,
}
