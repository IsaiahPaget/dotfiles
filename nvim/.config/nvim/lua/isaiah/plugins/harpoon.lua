return {
	'ThePrimeagen/harpoon',
	config = function()
		local mark = require 'harpoon.mark'
		local ui = require 'harpoon.ui'
		local keymap = vim.keymap

		keymap.set("n", "<leader>a", mark.add_file, {desc = "[A]ppend file to harpoon"})
		keymap.set("n", "<C-e>", ui.toggle_quick_menu)
		keymap.set("n", "<leader>1", function () ui.nav_file(1) end, { desc = "Harpoon [1]"})
		keymap.set("n", "<leader>2", function () ui.nav_file(2) end, { desc = "Harpoon [2]"})
		keymap.set("n", "<leader>3", function () ui.nav_file(3) end, { desc = "Harpoon [3]"})
		keymap.set("n", "<leader>4", function () ui.nav_file(4) end, { desc = "Harpoon [4]"})
	end,
}
