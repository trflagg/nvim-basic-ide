-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
local silent = { silent = true }
local noremap = { noremap = true }
local noremapAndSilent = { silent = true, noremap = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Taylor's:
-- remap escape to jk
keymap("i", "jk", "<ESC>", noremap)

keymap("n", "B", "^", noremap)
keymap("n", "E", "$", noremap)

-- tmux movement
keymap("n", "<c-j>", "<c-w>j", noremap)
keymap("n", "<c-h>", "<c-w>h", noremap)
keymap("n", "<c-k>", "<c-w>k", noremap)
keymap("n", "<c-l>", "<c-w>l", noremap)
--
-- handy rename
keymap('n', '<leader>rn', '"zye:%s/<C-R>z/')

-- console log
keymap('n', '<leader>cl', "zyeoconsole.log(`taylor  <esc>Pa: ${JSON.stringify(<esc>pa, null, ' ')}`);<esc>")
keymap('n', '<leader>cc', "oconsole.log(`taylor `);<esc>F`i")

-- edit and source prefs files
keymap("n", "<leader>ei", ":e ~/.config/nvim/lua/user<CR>")
keymap("n", "<leader>ek", ":e ~/.config/nvim/lua/user/keymaps.lua<CR>")
keymap("n", "<leader>ep", ":e ~/.config/nvim/lua/user/plugins.lua<CR>")
keymap("n", "<leader>s", ":source %<CR>")

-- Remove highlights
keymap("n", "<ESC>", ":noh<CR><CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":b#<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- enter goyo
keymap("n", "<leader>gy", ":Goyo<CR>", silent)

-- change background
keymap("n", "<leader>ll", ":set background=light<CR>");
keymap("n", "<leader>dd", ":set background=dark<CR>");
--
-- Telescope
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)

keymap("n", "<C-p>", "<CMD>lua require('telescope.builtin').git_files()<CR>")
keymap("n", "<leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
keymap("n", "<leader>fs", "<CMD>lua require('telescope.builtin').grep_string()<CR>")
keymap("n", "<leader>fr", "<CMD>lua require('telescope.builtin').references()<CR>")
keymap("n", "<leader>fd", "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>")
keymap("n", "<leader>fi", "<CMD>lua require('telescope.builtin').lsp_implementation()<CR>")
keymap("n", "<leader>fe", "<CMD>lua require('telescope.builtin').diagnostics()<CR>")
keymap("n", "<leader>ft", "<CMD>lua require('telescope.builtin').treesitter()<CR>")
keymap("n", "<leader>ff", "<CMD>lua require('telescope.builtin').buffers()<CR>")
keymap("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
keymap("n", "<leader><leader>", "<CMD>lua require('telescope.builtin').buffers()<CR>")
keymap("n", "<leader>fo", "<CMD>lua require('telescope.builtin').oldfiles()<CR>")
keymap("n", "<leader>fq", "<CMD>lua require('telescope.builtin').quickfix()<CR>")
keymap("n", "<leader>f<leader>", [[<Cmd>lua require('telescope.builtin').resume()<CR>]], noremapAndSilent)
keymap("i", "<C-q>", "<CMD>lua actions.smart_add_to_qflist + actions.open_qflist<CR>");


-- end Taylor

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
