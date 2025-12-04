vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- window management
keymap.set('n', '<leader>ss', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sd', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- move stuff
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
keymap.set('x', '<leader>p', [["_dP]])

keymap.set('n', 'Q', '<nop>')
keymap.set('n', '<C-z>', '<nop>')
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

keymap.set('n', '<leader>re', function()
	require('isaiah.custom.run-sh').run_exec()
end, { desc = 'Run a shell script from cwd' }, { silent = true })
-- Alt + =  (same key as +)
keymap.set("n", "<M-=>", ":resize +2<CR>")
keymap.set("n", "<M-->", ":resize -2<CR>")

-- Optional: horizontal resizing
keymap.set("n", "<M-+>", ":vertical resize +2<CR>")
keymap.set("n", "<M-_>", ":vertical resize -2<CR>")
