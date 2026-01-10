return { -- Autoformat
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	keys = {
		{
			'<leader>fb',
			function()
				require('conform').format { async = true, lsp_fallback = true }
			end,
			mode = '',
			desc = '[F]ormat [B]uffer',
		},
	},
	opts = {
		notify_on_error = false,
		-- format_on_save = {
		-- 	lsp_fallback = true,
		-- 	async = false,
		-- 	timeout_ms = 1000,
		-- },
		formatters_by_ft = {
			lua = { 'stylua' },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
