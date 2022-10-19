-- Set up LSP
use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'neovim/nvim-lspconfig'
}

use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

use {
	"folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("trouble").setup {}
	end
}

use {
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
}

use {
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip'
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}


-- use {
-- 	"ms-jpq/coq_nvim",
-- }
--
-- use {
-- 	"ms-jpq/coq.artifacts",
-- }

use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga()
    end,
}

require("mason").setup()
require("mason-lspconfig").setup()
-- require("comment").setup()
