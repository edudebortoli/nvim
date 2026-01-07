-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.autocmds")
require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.open_env")
require("config.json_to_env")
vim.cmd([[colorscheme solarized-osaka]])
