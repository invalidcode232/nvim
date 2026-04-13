return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        statuscolumn = { enabled = true, },
        picker = { enabled = true, },
        dashboard = { enabled = true, },
        notify = { enabled = true, },
        explorer = { enabled = true },
        indent = { enabled = true },
        bufdelete = { enabled = true },
        image = { enabled = true },
    },
    keys = {
        -- Main commands
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

        -- Find commands
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

        -- Buffer management
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
        { "<leader>bad", function() Snacks.bufdelete.all() end, desc = "Delete all buffers" },
        { "<leader>bod", function() Snacks.bufdelete.other() end, desc = "Delete all other buffers" },
    },
}
