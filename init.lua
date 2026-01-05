-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.autocmds")
require("config.keymaps")
require("config.options")
require("config.lazy")
vim.cmd([[colorscheme solarized-osaka]])
