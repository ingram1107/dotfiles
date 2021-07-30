local builtin = require('telescope.builtin')

local M = {}

function M.rg()
  builtin.find_files {
    find_command = { 'rg', '--files', },
  }
end

function M.rg_dot()
  builtin.find_files {
    find_command = { 'rg', '--files', },
    hidden = true,
    follow = true,
    cwd = "~/.config",
    prompt_title = "Dotfiles",
  }
end

function M.live_grep()
  builtin.live_grep {
    previewer = false,
  }
end

function M.git_branches()
  builtin.git_branches {
    layout_strategy = 'vertical',
  }
end

function M.buffers()
  builtin.buffers {
    layout_strategy = 'vertical',
  }
end

function M.current_buffer_fuzzy_find()
  builtin.current_buffer_fuzzy_find {
    previewer = false,
  }
end

return M
