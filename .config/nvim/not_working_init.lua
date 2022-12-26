local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
-- File searching
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
-- Auto complete
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('dense-analysis/ale')
-- lualine
Plug('nvim-lualine/lualine.nvim')
Plug('kyazdani42/nvim-web-devicons')
vim.call('plug#end')

-- keymap
vim.g.mapleader = " "

-- telescope

vim.cmd([[
set number relativenumber
set encoding=utf-8
]])

-- lualine
require('lualine').setup{
	options = {
		theme = 'everforest'
	}
}

-- fzf

-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
