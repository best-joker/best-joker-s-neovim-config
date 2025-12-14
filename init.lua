require("core.options")
require("plugins.plugins-setup")
require("plugins.lualine")
require("core.keymaps")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.bufferline")
require("plugins.gitsigns")
require("plugins.toggleterm")

-- vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe"'
-- vim.opt.shellcmdflag = "-Command"

-- 背景透明
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  "hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
]]
