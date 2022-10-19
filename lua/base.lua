local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
end

vim.cmd 'packadd packer.nvim'

packer = require('packer')

packer.init {
		auto_clean = true,
		compile_on_sync = true,
		auto_reload_compiled = true,
		display = {
			open_fn = function()
				return require 'packer.util'.float {
					border = 'single'
				}
			end
		}
}

-- Handy api bindings
use = packer.use
map = vim.keymap.set
au = vim.api.nvim_create_autocmd
cmd = vim.cmd
colorscheme = cmd.colorscheme
opt = vim.opt
g = vim.g
diagnostic = vim.diagnostic
keyset = vim.keymap.set

silent = { silent = true }

-- Add packer itself
use {
	'wbthomason/packer.nvim',
	cmd = {
		'PackerSnapshot',
		'PackerSnapshotRollback',
		'PackerSnapshotDelete',
		'PackerInstall',
		'PackerUpdate',
		'PackerSync',
		'PackerClean',
		'PackerCompile',
		'PackerStatus',
		'PackerProfile',
		'PackerLoad'
	}
}

use {
	'lewis6991/impatient.nvim'
}

require('impatient')

vim.o.clipboard = 'unnamedplus'

