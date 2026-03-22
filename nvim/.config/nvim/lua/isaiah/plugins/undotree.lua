return {
	'mbbill/undotree',
	config = function ()
		local keymap = vim.keymap
		keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree"})
	end
}
