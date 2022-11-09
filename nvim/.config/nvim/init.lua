require('base')
require('autocmds')
require('highlights')
require('maps')
require('plugins')
require('autosave')
require('colors')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end

-- last-color.nvim call to get the last call to :colorscheme
-- local theme = require('last-color').recall() or 'kanagawa'
-- vim.cmd(('colorscheme %s'):format(theme))
