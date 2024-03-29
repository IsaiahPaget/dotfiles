---@type ChadrcConfig
local M = {}

M.ui = {
    theme = 'gruvbox',
    -- hl_override = {
    --     Normal = {
    --         bg = "NONE"
    --     },
    -- },
    tabufline = {
        show_numbers = false,
        enabled = false,
        lazyload = true,
        overriden_modules = nil,
    },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
