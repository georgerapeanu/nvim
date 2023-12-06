local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<Space>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<Space>r", function() harpoon:list():remove() end)
vim.keymap.set("n", "<Space>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<Space>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<Space>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<Space>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<Space>4", function() harpoon:list():select(4) end)
