local keymap = vim.keymap

-- Save
keymap.set('n', ';w', ':w<Return>')

-- Replace word with yanked text
keymap.set('n', ';p', 'ciw<C-R>0<Esc>')

-- Quit
keymap.set('n', ';q', ':q<Return>')

-- Source lua file
keymap.set('n', ';o', ':so %<Return>')

-- Don't yank on x
keymap.set('n', 'x', '"_x')

-- Ctrl delete
keymap.set('i', '<C-H>', '<C-W>')

-- Exit insert mode
keymap.set('i', 'jk', '<Esc>')
keymap.set('i', 'kj', '<Esc>')

-- Clear highlighted
keymap.set('n', '<C-l>', ':noh<Return><C-l>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit ')

-- Close tab
keymap.set('n', ';x', ':bdelete<Return>')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
