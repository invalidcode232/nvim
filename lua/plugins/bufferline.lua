return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
        options = {
            offsets = { -- For file explorer plugins
                { -- Support for neo-tree
                  filetype = "neo-tree",
                  text = "Neo-tree",
                  highlight = "Directory",
                  text_align = "left",
                },
                { -- Support for snacks.explorer
                    filetype = "snacks_layout_box",
                    -- text = '󰙅  File Explorer',
                    -- separator = true,
                },
            }
        }
    },
    keys = {
        { "<S-h>", "<Cmd>BufferLineCyclePrev<Cr>", desc = "Previous buffer" },
        { "<S-l>", "<Cmd>BufferLineCycleNext<Cr>", desc = "Next buffer" },
    },
    config = function (_, opts)
        require("bufferline").setup(opts)
    end,
}
