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
	priority = 1000,
	lazy = false,
	init = function()
		vim.cmd.colorscheme(colorscheme)

		-- Statusline
		vim.cmd 'hi StatusLine guibg=NONE'

		-- Main editor
		vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn",  { bg = "none" })

		-- NvimTree
		vim.api.nvim_set_hl(0, "NvimTreeNormal",   { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
	end,
}
