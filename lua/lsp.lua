-- Set up LSP
use {
  'neoclide/coc.nvim',
  branch = 'release',
}

-- use {
-- 	"windwp/nvim-autopairs",
--     config = function() require("nvim-autopairs").setup {} end
-- }

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {}
  end
}
