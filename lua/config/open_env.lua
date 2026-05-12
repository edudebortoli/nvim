local function open_env_file()
	local project_root = vim.fn.getcwd()
	local env_js_path = project_root .. "/src/assets/env.js"
	local env_file_path = project_root .. "/.env"

	if vim.fn.filereadable(env_js_path) == 1 then
		vim.cmd("edit " .. env_js_path)
		return
	end

	if vim.fn.filereadable(env_file_path) == 1 then
		vim.cmd("edit " .. env_file_path)
		return
	end

	vim.notify("Neither src/assets/env.js nor .env file found in the project.", vim.log.levels.WARN)
end

vim.keymap.set("n", "<C-t>", open_env_file, { noremap = true, silent = true })
