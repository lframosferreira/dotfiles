return {
    -- Preview Markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
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
}
