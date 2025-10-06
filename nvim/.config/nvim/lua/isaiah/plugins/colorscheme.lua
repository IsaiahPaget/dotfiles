-- Try to load the theme definition
local ok, theme = pcall(dofile, vim.fn.expand '~/.config/omarchy/current/theme/neovim.lua')

-- Fallback defaults
local path = 'ellisonleao/gruvbox.nvim'
local colorscheme = 'gruvbox'

if ok and type(theme) == 'table' then
	-- Try to get plugin path (first entry, first string)
	if theme[1] and type(theme[1]) == 'table' and theme[1][1] then
		path = theme[1][1]
		colorscheme = theme[2].opts.colorscheme
	end
end

return {
	path,
	priority = 1000, -- Load before all others
	lazy = false,
	init = function()
		-- Load the colorscheme dynamically
		vim.cmd.colorscheme(colorscheme)
		vim.cmd 'hi statusline guibg=NONE'
	end,
}
