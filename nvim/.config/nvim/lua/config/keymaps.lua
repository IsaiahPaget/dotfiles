local keymap = vim.keymap

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
