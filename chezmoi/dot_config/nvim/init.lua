vim.g.mapleader = ''

vim.o.autoindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.expandtab = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wrap = false

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
	  transparent_mode = true,
      })
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').setup({'nvim-treesitter/nvim-treesitter', build = 'TSUpdate'})
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim', -- optional
      'williamboman/mason-lspconfig.nvim', -- optional
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
--    config = function()
--      local lsp = require('lsp-zero').present({})
--      lsp.on_attach(function(client, bufnr)
--        lsp.default_keymaps({buffer = bufnr})
--      end)
--      lsp.setup()
--    end,
  },
--  defaults = {
--    lazy = true,
--    version = '*',
--  },
})