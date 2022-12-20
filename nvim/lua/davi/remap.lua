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
