return {
	'ThePrimeagen/harpoon',
	config = function()
		local mark = require 'harpoon.mark'
		local ui = require 'harpoon.ui'
		local keymap = vim.keymap

		keymap.set("n", "<leader>a", mark.add_file, {desc = "[A]ppend file to harpoon"})
		keymap.set("n", "<leader>eh", ui.toggle_quick_menu)
		keymap.set("n", "<leader>y", function () ui.nav_file(1) end, { desc = "Harpoon [1]"})
		keymap.set("n", "<leader>u", function () ui.nav_file(2) end, { desc = "Harpoon [2]"})
		keymap.set("n", "<leader>i", function () ui.nav_file(3) end, { desc = "Harpoon [3]"})
		keymap.set("n", "<leader>o", function () ui.nav_file(4) end, { desc = "Harpoon [4]"})
		keymap.set("n", "<leader>p", function () ui.nav_file(5) end, { desc = "Harpoon [5]"})
	end,
}
