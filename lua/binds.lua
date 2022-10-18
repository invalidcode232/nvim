keyset("n", "<C-s>", ":w<cr>")
keyset("n", "<Space>h", ":nohl<cr>")

keyset("n", "<Space>e", ":NvimTreeToggle<cr>")

keyset("n", "<Space>/", "<Plug>(comment_toggle_linewise_current)")
keyset("v", "<Space>/", "<Plug>(comment_toggle_linewise_visual)")

keyset("n", "<Space>ff", ":Telescope find_files<cr>")
keyset("n", "<Space>fg", ":Telescope live_grep<cr>")
keyset("n", "<Space>fb", ":Telescope buffers<cr>")
keyset("n", "<Space>fh", ":Telescope help_tags<cr>")

keyset("n", "<A-h>", ":bprev<cr>")
keyset("n", "<A-l>", ":bnext<cr>")
keyset("n", "<A-x>", ":BufferClose<cr>")

keyset("n", "<C-`>", ":ToggleTerm direction=vertical size=100<cr>")
keyset("t", "<C-`>", "<C-\\><C-N>:ToggleTerm direction=vertical size=100<cr>")
keyset("i", "<C-`>", "<C-\\><C-N>:ToggleTerm direction=vertical size=100<cr>")

vim.cmd([[
    :tnoremap <C-h> <C-\><C-N><C-w>h
    :tnoremap <C-j> <C-\><C-N><C-w>j
    :tnoremap <C-k> <C-\><C-N><C-w>k
    :tnoremap <C-l> <C-\><C-N><C-w>l
		:inoremap <C-h> <C-\><C-N><C-w>h
    :inoremap <C-j> <C-\><C-N><C-w>j
    :inoremap <C-k> <C-\><C-N><C-w>k
    :inoremap <C-l> <C-\><C-N><C-w>l
    :nnoremap <C-h> <C-w>h
    :nnoremap <C-j> <C-w>j
    :nnoremap <C-k> <C-w>k
    :nnoremap <C-l> <C-w>l
]])

