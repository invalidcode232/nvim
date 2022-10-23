keyset('n', '<C-s>', ':w<cr>', silent)
keyset('n', '<Space>h', ':nohl<cr>', silent)

keyset('n', '<Space>e', ':NvimTreeToggle<cr>', silent)

keyset("n", "<Space>/", "<Plug>(comment_toggle_linewise_current)")
keyset("v", "<Space>/", "<Plug>(comment_toggle_linewise_visual)")

keyset('n', '<Space>ff', ':Telescope find_files<cr>', silent)
keyset('n', '<Space>fg', ':Telescope live_grep<cr>', silent)
keyset('n', '<Space>fb', ':Telescope buffers<cr>', silent)
keyset('n', '<Space>fh', ':Telescope help_tags<cr>', silent)

keyset('n', '<A-h>', ':BufferPrev<cr>', silent)
keyset('n', '<A-l>', ':BufferNext<cr>', silent)
keyset('n', '<A-x>', ':BufferClose<cr>', silent)

keyset('n', '<C-`>', ':ToggleTerm direction=vertical size=80<cr>', silent)
keyset('t', '<C-`>', '<C-\\><C-N>:ToggleTerm direction=vertical size=80<cr>', silent)
keyset('i', '<C-`>', '<C-\\><C-N>:ToggleTerm direction=vertical size=80<cr>', silent)

keyset('n', '<Space>t', ':TroubleToggle<cr>', silent)
keyset("n", "<C-`>", ":ToggleTerm direction=vertical size=80<cr>", silent)
keyset("t", "<C-`>", "<C-\\><C-N>:ToggleTerm direction=vertical size=80<cr>", silent)
keyset("i", "<C-`>", "<C-\\><C-N>:ToggleTerm direction=vertical size=80<cr>", silent)

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

vim.cmd([[
    nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
    nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
    nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
]])
-- keyset('n', '<Space>/', 'gcc')
-- keyset('v', '<Space>/', 'gc')
