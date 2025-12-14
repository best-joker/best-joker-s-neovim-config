-- 主键是空格
vim.g.mapleader = " "

local keymap = vim.keymap

-- 插件nvim-tree
keymap.set("n","<leader>tr",":NvimTreeToggle<CR>")

-- 分割线标签页
-- 上一个 buffer
keymap.set("n", "<leader><PageUp>", ":bprevious<CR>")

-- 下一个 buffer
keymap.set("n", "<leader><PageDown>", ":bnext<CR>")

-- 关闭分割线
keymap.set("n", "<leader>w", ":bdelete<CR>")

-- 打开终端
keymap.set("n", "<leader>\\", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })


-- 切换窗口：ctrl + w + 方向键
-- 在文件树中输入a创建新的文件
