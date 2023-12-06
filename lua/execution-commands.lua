--  reference
--https://neovim.io/doc/user/lua-guide.html#lua-guide-autocommands
--  https://neovim.io/doc/user/autocmd.html#autocmd-pattern
vim.api.nvim_create_autocmd("FileType", {
  pattern={"rust"},
  callback = function(args) 
    vim.keymap.set('n', '<Space>e', [[:w<CR>:FloatermNew --autoclose=0 cargo run<CR>]], {buffer=args.buf})
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern={"cpp"},
  callback = function(args) 
    vim.keymap.set('n', '<Space>e', [[:w<CR>:FloatermNew --autoclose=0 g++ -Wall -Wextra -Wpedantic -Wconversion -Warith-conversion -std=c++11 -o %< % -O2 && ./%< <CR>]], {buffer=args.buf})
    vim.keymap.set('n', '<Space>d', [[:w<CR>:FloatermNew --autoclose=0 g++ -Wall -Wextra -Wpedantic -Wconversion -Warith-conversion -std=c++11 -o %< % -O0 -g -fsanitize=undefined,address,signed-integer-overflow && ./%< <CR>]], {buffer=args.buf})
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern={"CMakeLists.txt"},
  callback = function(args)
    os.execute("cmake " .. '"' .. vim.loop.cwd() .. '" > /dev/null 2>&1')
    vim.cmd [[:LspRestart]]
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.ml", "*.mli", "*.menhir", "*.interface", "*.ocamllex", "*.re"},
  callback = function(args)
    os.execute("dune fmt > /dev/null 2>&1")
  end
})

vim.keymap.set('n', '<Space>r', [[:FloatermNew --autoclose=0 ./run.sh<CR>]], {})
