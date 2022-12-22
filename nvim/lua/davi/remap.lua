vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks of text from selection
vim.keymap.set("n", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "K", ":m '<-2<CR>gv=gv")

-- Half page jumps keeps cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search terms keeps cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- x does not copy deleted character
vim.keymap.set("n", "x", '"_x')

-- jk exits insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- increase numbers easily
vim.keymap.set("n", "<leader>+", "<C-a>")
vim.keymap.set("n", "<leader>-", "<C-x>")

-- split windows
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make it equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window

-- tab management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
