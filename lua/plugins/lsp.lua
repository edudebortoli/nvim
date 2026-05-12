return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls", "eslint", "html" },
			automatic_install = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["angularls"] = function()
					require("lspconfig").angularls.setup({
						root_dir = require("lspconfig.util").root_pattern("angular.json"),
					})
				end,
			},
		},
	},
}
