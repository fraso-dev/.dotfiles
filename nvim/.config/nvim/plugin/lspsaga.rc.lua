local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga()

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gn', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', 'H', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gs', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
