return {
	'isaiahpaget/modes.nvim',
	opts = {
		colors = {
			bg = '', -- Optional bg param, defaults to Normal hl group
			copy = '#fabd2f',
			delete = '#fb4934',
			insert = '#83a598',
			visual = '#d65d0e',
		},

		-- Set opacity for cursorline and number background
		line_opacity = 0.01,

		-- Enable cursor highlights
		set_cursor = true,
		set_cursorline = false,
	},
}
