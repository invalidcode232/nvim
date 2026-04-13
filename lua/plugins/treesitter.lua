LANGUAGES = {
    "javascript",
    "python",
    "cpp",
    "rust",
    "html",
    "sql",
    "markdown",
    "latex",
    "lua",
}

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    opts = {
        indent = { enable = true }, ---@type lazyvim.TSFeat
        highlight = { enable = true }, ---@type lazyvim.TSFeat
        folds = { enable = true }, ---@type lazyvim.TSFeat
        ensure_installed = LANGUAGES,
    },
    config = function (_, opts)
        local TS = require("nvim-treesitter")
        TS.setup(opts)
    end
}

