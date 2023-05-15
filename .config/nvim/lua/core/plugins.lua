-- set up lazy loading for plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- clone the latest stable release of lazy.nvim
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
-- add lazy loading path to runtimepath
vim.opt.rtp:prepend(lazypath)

-- configure lazy loaded plugins
require("lazy").setup({

    -- utility --

    "nvim-lua/plenary.nvim", -- a Lua library with a focus on high-level and useful.

    {
        "rcarriga/nvim-notify", -- a simple, lightweight notification library.
        config = function()
            require("configs.notify_setup")
        end,
    },

    {
        "numToStr/Comment.nvim", -- a commenting plugin.
        config = function()
            require("configs.comment_setup")
        end,
    },

    {
        "ur4ltz/surround.nvim", -- a plugin that provides mappings to easily surround text with parentheses, brackets, quotes, and more.
        config = function()
            require("configs.surround_setup")
        end,
    },

    {
        "windwp/nvim-autopairs", -- a lightweight autopair plugin.
        config = function()
            require("configs.autopairs_setup")
        end,
    },

    {
        "numToStr/FTerm.nvim", -- a floating terminal plugin.
        config = function()
            require("configs.fterm_setup")
        end,
    },

    -- completion --

    {
        "hrsh7th/nvim-cmp", -- a completion plugin that supports various sources (buffer, path, tags, etc.).
        config = function()
            require("configs.cmp_setup")
        end,
    },

    "hrsh7th/cmp-buffer", -- a buffer source for nvim-cmp.

    "hrsh7th/cmp-path", -- a path source for nvim-cmp.

    "hrsh7th/cmp-cmdline", -- a cmdline source for nvim-cmp.

    "L3MON4D3/LuaSnip", -- a snippet plugin for Neovim written in Lua.

    "saadparwaiz1/cmp_luasnip", -- a LuaSnip source for nvim-cmp.

    "rafamadriz/friendly-snippets", -- a collection of friendly snippets for various programming languages.

    -- LSP (Language Server Protocol) --

    {
        "neovim/nvim-lspconfig", -- a collection of configurations for built-in LSP client in Neovim.
        config = function()
            require("configs.lsp.lsp_setup")
        end,
    },

    "hrsh7th/cmp-nvim-lsp", -- a source for nvim-cmp that provides LSP completion suggestions.

    {
        "jose-elias-alvarez/null-ls.nvim", -- a plugin that allows you to use LSP diagnostics and code actions without a language server.
        config = function()
            require("configs.lsp.null-ls_setup")
        end,
    },

    "jayp0521/mason-null-ls.nvim", -- a null-ls integration for mason.nvim.

    "williamboman/mason-lspconfig.nvim", -- a lspconfig integration for mason.nvim.

    {
        "williamboman/mason.nvim", -- a plugin that manages multiple LSP servers within Neovim.
        config = function()
            require("configs.lsp.mason_setup")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter", -- a plugin that provides text analysis and parsing for many languages.
        config = function()
            require("configs.treesitter_setup")
        end,
    },

    -- file navigation --
    {
        "nvim-neo-tree/neo-tree.nvim", -- a file explorer tree plugin.
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("configs.neotree_setup")
        end,
    },
    {
        "akinsho/bufferline.nvim", -- a plugin that provides a buffer line.
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.buffers_setup")
        end,
    },
    {
        "nvim-telescope/telescope.nvim", -- a plugin that provides fuzzy finding and a live grep search tool.
        "nvim-telescope/telescope-fzf-native.nvim", -- a plugin that provides a FZF source for Telescope.
        config = function()
            require("configs.telescope_setup")
        end,
    },

    -- git integration --

    {
        "lewis6991/gitsigns.nvim", -- a plugin that shows Git diff markers in the sign column.
        config = function()
            require("configs.gitsigns_setup")
        end,
    },

    "kdheepak/lazygit.nvim", -- a plugin to use lazygit inside Neovim.

    -- ui --

    {
        "onsails/lspkind.nvim", -- a plugin that adds vscode-like pictograms to nvim-cmp's completion menu.
        config = function()
            require("configs.lspkind_setup")
        end,
    },

    {
        "nvim-lualine/lualine.nvim", -- a plugin that creates customizable statuslines and prompts in Neovim.
        config = function()
            require("configs.lualine_setup")
        end,
    },

    {
        "shaunsingh/nord.nvim", -- a comfortable dark color scheme.
        priority = 1000,
        config = function()
            require("core.themes")
        end,
    },
})
