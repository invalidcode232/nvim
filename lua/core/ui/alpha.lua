
-- Cool dashboard
use {
	'goolord/alpha-nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	config = function()
		require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
	end
}
