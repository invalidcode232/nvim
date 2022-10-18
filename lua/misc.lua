use {
  "ggandor/leap.nvim",
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use {
  'gelguy/wilder.nvim',
}

local wilder = require("wilder")
wilder.setup({modes = {':', '?'}})

require("leap").add_default_mappings()

keyset("n", "<Space>/", "gcc")
keyset("v", "<Space>/", "gc")
