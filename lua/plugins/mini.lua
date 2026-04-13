return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function ()
        -- Core editor
        require("mini.pairs").setup()
        require("mini.icons").setup()
        require("mini.surround").setup()
        require("mini.comment").setup()

        -- Misc
        -- Cmdline autocomplete and improvements
        require("mini.cmdline").setup()

        -- Nicer statusline
        require("mini.statusline").setup()
    end
}
