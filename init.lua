-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.autocmds")
require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.open_env")
require("config.json_to_env")
-- Set colorscheme after options
vim.cmd("colorscheme flexoki-dark")
-- vim.cmd('colorscheme flexoki-light')
