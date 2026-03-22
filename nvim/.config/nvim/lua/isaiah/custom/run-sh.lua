local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local M = {}

-- Run a shell script from Neovim's starting directory
local function run_file(file)
  local fullpath = vim.fn.fnamemodify(file, ":p")  -- absolute path
  vim.fn.jobstart({ fullpath }, {
    cwd = vim.fn.getcwd(),
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.run_exec()
	pickers.new({}, {
		prompt_title = "Run .sh or .bin file",
		finder = finders.new_oneshot_job({ "fd", "-I", "--type=f", "--extension=sh", "--extension=bin", "." }, { cwd = vim.fn.getcwd() }),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			local run = function()
				local entry = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				if entry and entry[1] then
					run_file(entry[1])
				end
			end


			map("i", "<CR>", run)
			map("n", "<CR>", run)
			return true
		end,
	}):find()
end

return M
