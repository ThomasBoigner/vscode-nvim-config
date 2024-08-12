require('config.nvim.remap')
require('config.nvim.set')


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup(
    {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },

        {
            "catppuccin/nvim", name = "catppuccin", priority = 1000 
        },
        {
            "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
        },
        {
            "mbbill/undotree"
        },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                { 'neovim/nvim-lspconfig' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/nvim-cmp' },
                { 'L3MON4D3/LuaSnip' },

                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },
            }
        }
    })
