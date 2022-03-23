local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap comma as leader keymap
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes:
-- Normal mode = "n"
-- Insert mode = "i"
-- Visual mode = "v"
-- Visual block mode = "x"
-- Terminal mode = "t"
-- Command mode = "c"

-- Normal mode

-- Open Left Explorer
keymap("n", "<leader>m", ":Lex 20<CR>", opts)

-- Window split creation
keymap("n", "<leader>h", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Window navigation
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Hide highlight search until next search
keymap("n", "<leader>/", ":noh<CR>", opts)

-- Telescope mapping
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

