
-- Nvim tree
use {
	'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
	tag = 'nightly',
}


require('nvim-tree').setup {
	diagnostics = {
		enable = true,
	}
}
