-- 局部变量
local opt = vim.opt

-- 行号
opt.relativenumber = false
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 启用鼠标
opt.mouse:append("a")

-- 高亮光标所在行
opt.cursorline = true

-- 防止代码因为不能显示完全而换行
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 新窗口行为
opt.splitright = true
opt.splitbelow = true

-- 搜索设置
opt.ignorecase = true
opt.smartcase = false

-- 显示颜色
opt.termguicolors = true

-- 显示侧边栏
opt.signcolumn = "yes"

-- 主题
vim.cmd[[colorscheme tokyonight-moon]]
-- 当前主题有night，storm，day，moon四种配色
