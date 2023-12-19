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

    },
    v = {
        ["J"] = { ":m '>+1<CR>gv=gv", "Move highlighted text down"},
        ["K"] = { ":m '<-2<CR>gv=gv", "Move highlighted text up"},
    },
    x = {
        ["<leader>p"] = { "\"_dP", "pastes without loosing what you pasted in buffer"}
    }
}

return M
