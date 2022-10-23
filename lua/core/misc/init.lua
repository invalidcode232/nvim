local function setup()
	require 'core.misc.leap'
	require 'core.misc.startuptime'
	require 'core.misc.toggleterm'
	require 'core.misc.presence'
	require 'core.misc.wilder'
end

return {
	setup = setup,
}
