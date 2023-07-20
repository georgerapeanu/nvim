-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- open tree on startup
local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end
--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- empty setup using defaults
require("nvim-tree").setup({
})

require("nvim-tree.api").tree.toggle_gitignore_filter()
-- fetch keymap
local map = vim.api.nvim_set_keymap

-- map the key n to run the command :NvimTreeToggle
map('n', 't', [[:NvimTreeToggle<CR>]], {})
