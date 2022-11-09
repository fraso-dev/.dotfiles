-- In order to mapp this function you have to map the command below:
-- :lua require('colors').choose_colors()
--
-- Modify the list of colors or uncomment the function that takes all possible colors

local choose_colorscheme = function()
  local actions = require "telescope.actions"
  local actions_state = require "telescope.actions.state"
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local sorters = require "telescope.sorters"
  local dropdown = require "telescope.themes".get_dropdown()

  function enter(prompt_bufnr)
    local selected = actions_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
    vim.cmd("silent !echo 'vim.cmd[[ " .. cmd .. " ]]' > ~/.config/nvim/lua/colorscheme.lua")
    actions.close(prompt_bufnr)
  end

  function next_color(prompt_bufnr)
    actions.move_selection_next(prompt_bufnr)
    local selected = actions_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
  end

  function prev_color(prompt_bufnr)
    actions.move_selection_previous(prompt_bufnr)
    local selected = actions_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
  end

  local colors = vim.fn.getcompletion("", "color")

  local opts = {

    --finder = finders.new_table {"gruvbox", "nordfox", "nightfox", "monokai", "tokyonight"},
    finder = finders.new_table(colors),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", enter)
      map("i", "<C-j>", next_color)
      map("i", "<C-k>", prev_color)
      map("n", "<CR>", enter)
      map("n", "j", next_color)
      map("n", "k", prev_color)
      return true
    end,

  }

  local colors = pickers.new(dropdown, opts)

  colors:find()
end

vim.api.nvim_create_user_command("Colorscheme", function()
  choose_colorscheme()
end, {})
