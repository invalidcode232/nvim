use {
  "ggandor/leap.nvim",
}

use {
  'gelguy/wilder.nvim',
}

use {
	"akinsho/toggleterm.nvim"
}

use {
	'dstein64/vim-startuptime'
}

local wilder = require("wilder")
wilder.setup({modes = {':', '?'}})

require("leap").add_default_mappings()
require("toggleterm").setup {
	function (term)
		    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 5
    end
	end
}

keyset("n", "<Space>/", "gcc")
keyset("v", "<Space>/", "gc")
