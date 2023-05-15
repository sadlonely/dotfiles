-- define options to be used in all keymaps
local default_opts = {
    noremap = true,
    silent = true,
}

-- function to set keymap with description
local function map(mode, key, cmd, desc)
    local opts = vim.tbl_extend("force", default_opts, desc)
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

-- keymaps for disabling arrow keys
map("n", "<up>", "<nop>", { desc = "Disable <up> key" })
map("n", "<down>", "<nop>", { desc = "Disable <down> key" })
map("n", "<left>", "<nop>", { desc = "Disable <left> key" })
map("n", "<right>", "<nop>", { desc = "Disable <right> key" })

-- keymaps for saving and quitting
map("n", "<leader>w", ":w<CR>", { desc = " Save file" })
map("n", "<leader>q", ":confirm q<CR>", { desc = " Quit" })
map("n", "<C-q>", ":q!<CR>", { desc = " Quit without saving" })

-- keymap for cutting text without yanking to register
map("n", "x", '"_x', { desc = "Cut text without yanking to register" })

-- keymaps for splitting windows
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- keymaps for managing tabs
map("n", "<leader>to", ":tabnew<CR>", { desc = " Open new tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = " Go to next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = " Go to previous tab" })

-- keymap for opening lazygit panel
map("n", "<leader>gg", ":LazyGit<CR>", { desc = " Open lazygit panel" })

-- keymaps for toggling FTerm
map("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>', { desc = " Terminal" })
map("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = " Terminal" })

-- keymap for executing Python files in FTerm
map("n", "<leader>p", ":Pyexec<CR>", { desc = " Execute Python file" })

-- keymaps for using Telescope plugin
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = " Open Telescope find files dialog" })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { desc = " Open Telescope live grep search" })

-- keymaps for using Neotree plugin
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = " Toggle Neotree" })
map("n", "<leader>o", ":Neotree focus<CR>", { desc = " Focus on Neotree" })

-- keymaps for LSP and diagnostics
map("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", { desc = " Open LSP diagnostic floating window" })
map("n", "<leader>dq", ":lua vim.diagnostic.setloclist()<CR>", { desc = " Set LSP diagnostic location list" })
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", { desc = " Show LSP code actions" })
map("n", "K", ":lua vim.lsp.buf.hover<CR>", { desc = " Show LSP hover information" })
map("n", "<leader>dt", ":lua toggle_diagnostics()<CR>", { desc = " Toggle diagnostics display" })
