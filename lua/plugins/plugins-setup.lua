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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufwritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' --主题
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
	'nvim-tree/nvim-tree.lua', --文档树
    requires = {
	  'nvim-tree/nvim-web-devicons', --文档树图标
	}
  }
  use {
      "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }
  
  -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use("christoomey/vim-tmux-navigator") --CTRL + h、j、k定位窗口
  use "nvim-treesitter/nvim-treesitter" --语法高亮
  use "p00f/nvim-ts-rainbow" --配合treesitter，不同括号不同颜色 

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" --git提示

  -- 终端插件
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
  }

  -- markdown文件渲染
  -- 在输出`:MarkdownPreview`之后在浏览器中渲染
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 0
    end,
  })

  use({
    "MeanderingProgrammer/render-markdown.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({})
    end,
  })
  
 if packer_bootstrap then
    require('packer').sync()
  end
end)
