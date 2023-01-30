local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- center screen
map('n', 'D', '<C-d>zz', opts)
map('n', 'U', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'G', 'Gzzzv', opts)

-- remove mapping
map('n', 'Q', '<nop>', opts)

-- because im lazy
map({ 'n', 'v' }, '<S-h>', '^', opts)
map({ 'n', 'v' }, '<S-l>', '$', opts)
map('n', '<C-a>', 'ggVG', opts)
map('n', '<leader><ESC>', '<cmd>qa<CR>', opts)

-- move code up and down
map('n', '<M-j>', ':m+<CR>', opts) -- move line down
map('n', '<M-k>', ':m-2<CR>', opts) -- move line up
map("x", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- move code block down
map("x", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- move code block up

-- better indents
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- buffer
map('n', '<M-h>', '<cmd>bprev<CR>', opts)
map('n', '<M-l>', '<cmd>bnext<CR>', opts)
map('n', '<leader>bd', '<cmd>bdelete<CR>', opts)

-- avoid vim register for some operations
map('n', 'x', '"_x', opts)
map("x", "p", '"_dP', opts)
map('n', '<leader>Y', '"+Y', opts) -- for yank commands but for system clipboard
map({ "n", "x" }, "<leader>y", '"+y', opts) -- copy to system clipboard
map({ "n", "x" }, "<leader>p", '"+p', opts) -- paste from system clipboard

-- split resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- tree
map('n', '<leader>ntt', '<cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>u', '<cmd>UndotreeToggle<CR>', opts)

--telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>ft', '<cmd>Telescope treesitter<CR>', opts)
map('n', '<leader>sd', '<cmd>Telescope flutter commands<CR>', opts)

-- search and replace
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- git
map("n", "gn", "<cmd>Gitsigns next_hunk<CR>", opts)
map("n", "gN", "<cmd>Gitsigns prev_hunk<CR>", opts)
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
map("n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>", opts)
map("n", "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", opts)
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gt", "<cmd>Telescope git_branches<CR>", opts)

-- minimap
map('n', '<Leader>mf', "<cmd>lua MiniMap.toggle_focus()<CR>", opts)
map('n', '<Leader>mr', "<cmd>lua MiniMap.refresh()<CR>", opts)
map('n', '<Leader>mt', "<cmd>lua MiniMap.toggle()<CR>", opts)

--[[

--debugger
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

--debug for go
map("n", "<leader>dg", ":lua require'dap-go'.debug_test()<CR>", opts)

]] --
