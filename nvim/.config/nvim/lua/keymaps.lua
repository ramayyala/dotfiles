-- Keymaps for nvim

-- move vim window panes
-- vim.keymap.set('n','<C-k>', ':wincmd k<CR>')
-- vim.keymap.set('n','<C-j>', ':wincmd j<CR>')
-- vim.keymap.set('n','<C-h>', ':wincmd h<CR>')
-- vim.keymap.set('n','<C-l>', ':wincmd l<CR>')
--
-- vim find and replace keymap shortcuts
-- find generally, have to input word of interest
vim.keymap.set("n", "<C-f>", "/")
-- find current word highlighted with cursor
vim.keymap.set("n", "<C-M-f>", ":lua vim.fn.feedkeys('/' .. vim.fn.expand('<cword>') .. '\\n')<CR>")
-- find and replace a ingular instance of the current word highlighted with cursor

-- vim.keymap.set("n", "<C-M-h>", [[:s/<C-r><C-w>//g<Left><Left>]])
vim.keymap.set("n", "<C-M-h>", [[:%s/<C-r><C-w>//g<Left><Left>]])

--yank to global clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

