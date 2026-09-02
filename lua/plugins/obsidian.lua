return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/notes",
			},
		},

		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
			default_tags = { "daily-notes" },
		},

		completion = {
			nvim_cmp = false,
			blink = { enabled = true },
			min_chars = 2,
		},

		mappings = {
			-- follow links with gf or <cr>
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
			-- toggle checkboxes
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},

		ui = {
			enable = true,
			update_debounce = 200,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			},
		},

		attachments = {
			img_folder = "assets/imgs",
		},

		new_notes_location = "current_dir",
		preferred_link_style = "wiki",
	},

	config = function(_, opts)
		require("obsidian").setup(opts)

		-- navigation & search
		vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "[O]bsidian [O]pen in app" })
		vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "[O]bsidian [N]ew note" })
		vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "[O]bsidian [F]ind note" })
		vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "[O]bsidian [S]earch content" })
		vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "[O]bsidian [B]acklinks" })
		vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "[O]bsidian [L]inks in note" })
		vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "[O]bsidian [W]orkspace" })

		-- daily notes
		vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "[O]bsidian [T]oday" })
		vim.keymap.set("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "[O]bsidian [Y]esterday" })
		vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<cr>", { desc = "[O]bsidian [D]ailies list" })

		-- editing
		vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "[O]bsidian [R]ename note" })
		vim.keymap.set("n", "<leader>oi", "<cmd>ObsidianTemplate<cr>", { desc = "[O]bsidian [I]nsert template" })
		vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "[O]bsidian [P]aste image" })
		vim.keymap.set("n", "<leader>oa", "<cmd>ObsidianTags<cr>", { desc = "[O]bsidian t[A]gs" })

		-- visual mode
		vim.keymap.set("v", "<leader>oL", "<cmd>ObsidianLinkNew<cr>", { desc = "[O]bsidian [L]ink selection to new note" })
		vim.keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "[O]bsidian [E]xtract to new note" })
		vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "[O]bsidian [L]ink selection to existing" })
	end,
}
