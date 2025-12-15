-- lua/plugins/plugins-setup.lua
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 先删除或注释掉自动编译功能，避免频繁触发
-- vim.cmd([[...]])

return require('packer').startup(function(use)
  -- Packer 自身
  use 'wbthomason/packer.nvim'
  
  -- 主题
  use 'folke/tokyonight.nvim'
  
  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  
  -- 文件树
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- === LSP 核心插件（必须分开声明）===
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- === 自动补全插件（分开声明）===
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'  -- 添加这个
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- 其他插件
  use 'christoomey/vim-tmux-navigator'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'
  use 'akinsho/bufferline.nvim'
  use 'lewis6991/gitsigns.nvim'
  
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = 'markdown'
  }

  use {
    'MeanderingProgrammer/render-markdown.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({})
    end,
  }
  
  -- 首次安装时自动同步插件
  if packer_bootstrap then
    require('packer').sync()
  end
end)
