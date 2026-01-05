-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Delete without yank
keymap.set("n", "x", '"_x')

-- the primeagen
-- move lines in Visual mode with J or K
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--center when jump
--keymap.set("n", "<C-d>", "<C-d>zz")
--keymap.set("n", "<C-u>", "<C-u>zz")

-- Go to normal mode in terminal and jj
keymap.set("t", "<Esc>", "<C-\\><C-n><CR>")
vim.keymap.set("i", "jj", "<Esc>")

-- Clear search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>v", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Takuya
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- keymap.set('n',"<leader>w", ":w<CR>", opts)
-- keymap.set('n',"<leader>q", ":q<CR>", opts)
--
--
--
keymap.set("n", "K", vim.lsp.buf.hover, { remap = false })
keymap.set("n", "gd", vim.lsp.buf.definition, { remap = false, desc = "Go to definition" })
keymap.set("n", "<leader>gr", vim.lsp.buf.references, { remap = false, desc = "Go to references" })
keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { remap = false, desc = "Go to implementation" })
keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { remap = false })
keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { remap = false })
keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { remap = false })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { remap = false })
