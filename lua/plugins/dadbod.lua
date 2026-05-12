return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	cmd = { "DBUI", "DBUIToggle" },
	keys = {
		{ "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
	},
	config = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_save_location = "~/.local/share/db_ui"
	end,
}
