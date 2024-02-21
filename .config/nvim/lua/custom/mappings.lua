local M = {}

M.general = {
    n = {
        ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", "toggle undotree"},
        ["<C-d>"] = { "<C-d>zz", "centers when traveling down"},
        ["<C-u>"] = { "<C-u>zz", "centers when traveling up"},
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
        ["n"] = { "nzzzv", "searching keeps cursor in middle"},
        ["N"] = { "Nzzzv", "searching keeps cursor in middle"},
        ["<leader>y"] = { "\"+y", "Yanks into systems clipboard"},
        ["<leader>Y"] = { "\"+Y", "Yanks into systems clipboard"},
    },
    v = {
        ["J"] = { ":m '>+1<CR>gv=gv", "Move highlighted text down"},
        ["K"] = { ":m '<-2<CR>gv=gv", "Move highlighted text up"},
        ["<leader>y"] = { "\"+y", "Yanks into systems clipboard"},
    },
    x = {
        ["<leader>p"] = { "\"_dP", "pastes without loosing what you pasted in buffer"}
    }
}

return M
