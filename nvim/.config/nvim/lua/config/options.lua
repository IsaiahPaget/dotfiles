local opt = vim.opt


vim.o.winborder = 'rounded'
-- phat cursor
opt.guicursor = ''
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- opt.autoindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.scrolloff = 8

-- Filetype mappings
vim.filetype.add({
  extension = {
    re = 'ocaml',
  },
})
