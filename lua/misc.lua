use {
  "ggandor/leap.nvim",
}

use {
  'gelguy/wilder.nvim',
}

use {
	'dstein64/vim-startuptime'
}

local wilder = require("wilder")
wilder.setup({modes = {':', '?'}})

require("leap").add_default_mappings()

keyset("n", "<Space>/", "gcc")
keyset("v", "<Space>/", "gc")
