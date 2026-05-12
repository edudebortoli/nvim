-- lua/copy_pg.lua
local function parse_env_file(filepath)
	local vars = {}
	local file = io.open(filepath, "r")
	if not file then return vars end

	for line in file:lines() do
		-- skip comments and empty lines
		if not line:match("^%s*#") and line:match("=") then
			local key, value = line:match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
			if key and value then
				-- strip surrounding quotes if present
				value = value:match('^"(.*)"$') or value:match("^'(.*)'$") or value
				vars[key] = value
			end
		end
	end

	file:close()
	return vars
end

vim.api.nvim_create_user_command("DBCopyUrl", function()
	-- try .env next to the current file, then cwd
	local current_file_dir = vim.fn.expand("%:p:h")
	local cwd = vim.fn.getcwd()

	local env_path = nil
	for _, dir in ipairs({ current_file_dir, cwd }) do
		local candidate = dir .. "/.env"
		if vim.fn.filereadable(candidate) == 1 then
			env_path = candidate
			break
		end
	end

	if not env_path then
		vim.notify("No .env file found", vim.log.levels.WARN)
		return
	end

	local env  = parse_env_file(env_path)
	local user = env["PG_USER"] or ""
	local pass = env["PG_PASSWORD"] or ""
	local host = env["PG_HOST"] or ""
	local port = env["PG_PORT"] or "5432"
	local db   = env["PG_DB_NAME"] or ""

	if user == "" or host == "" or db == "" then
		vim.notify("Missing PG_* vars in " .. env_path, vim.log.levels.WARN)
		return
	end

	local url = string.format("postgresql://%s:%s@%s:%s/%s", user, pass, host, port, db)
	vim.fn.setreg("+", url)
	vim.notify("Copied from " .. env_path, vim.log.levels.INFO)
end, {})

vim.keymap.set("n", "<leader>cdb", "<cmd>DBCopyUrl<cr>", { desc = "Copy DB URL from .env" })
