--  reference
--https://neovim.io/doc/user/lua-guide.html#lua-guide-autocommands
--  https://neovim.io/doc/user/autocmd.html#autocmd-pattern
vim.api.nvim_create_autocmd("FileType", {
  pattern={"rust"},
  callback = function(args) 
    vim.keymap.set('n', '<Space>e', [[:FloatermNew --autoclose=0 cargo run<CR>]], {buffer=args.buf})
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern={"cpp"},
  callback = function(args) 
    vim.keymap.set('n', '<Space>e', [[:FloatermNew --autoclose=0 g++ -std=c++11 -o _%< % -O2 <CR>]], {buffer=args.buf})
    vim.keymap.set('n', '<Space>d', [[:FloatermNew --autoclose=0 g++ -std=c++11 -o _%< % -O0 -static -g -fsanitize=undefined,address,signed-integer-overflow <CR>]], {buffer=args.buf})
  end
})


vim.keymap.set('n', '<Space>r', [[:FloatermNew --autoclose=0 ./run.sh<CR>]], {})
