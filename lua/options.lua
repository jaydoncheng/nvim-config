vim.cmd("set number")
vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- vim.keymap.set('n', '<leader>o', ':Explore<CR>')

vim.keymap.set('n', '{', '<Cmd>call search("[([{<]")<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>bd<CR>')
