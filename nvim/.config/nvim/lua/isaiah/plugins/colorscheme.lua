return {
	'ellisonleao/gruvbox.nvim',
	priority = 1000, -- Make sure to load this before all the other start plugins.
	lazy = false,
	init = function()
		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		vim.cmd.colorscheme 'gruvbox'
		vim.cmd ':hi statusline guibg=NONE'
	end,
}
