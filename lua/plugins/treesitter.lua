-- require'nvim-treesitter.configs'.setup {
--   -- 支持的语言
--   ensure_installed = {"vim","c","cpp","lua","python","java"},
--
--   highlight = { enable = true },
--   indent = { enable = true },
--
--   -- 不同颜色区分括号
--   rainbow = {
--     enable = true,
--     extended_mode = true,
--     max_file_lines = nil,
--   }
-- }

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "vim",
    "c",
    "cpp",
    "lua",
    "python",
    "java",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  -- 如果你没有安装 nvim-ts-rainbow2，请注释掉下面这段
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = nil,
  -- },
})
