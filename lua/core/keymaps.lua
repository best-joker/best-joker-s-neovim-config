-- 主键是空格
vim.g.mapleader = " "

local keymap = vim.keymap

-- 插件nvim-tree
keymap.set("n","<leader>t",":NvimTreeToggle<CR>")

-- 分割线标签页
-- 上一个 buffer
keymap.set("n", "<leader><PageUp>", ":bprevious<CR>")

-- 下一个 buffer
keymap.set("n", "<leader><PageDown>", ":bnext<CR>")

-- 关闭分割线
-- keymap.set("n", "<leader>w", ":bdelete<CR>")

-- 关闭分割线（自定义）
-- 安全删除 buffer，不关闭窗口
local function close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  -- 尝试切换到下一个 buffer
  vim.cmd("bnext")
  -- 如果切换失败（说明没有下一个），切到上一个
  if vim.api.nvim_get_current_buf() == bufnr then
    vim.cmd("bprevious")
  end
  -- 删除原来的 buffer
  vim.cmd("bdelete! " .. bufnr)
end

vim.keymap.set("n", "<leader>w", close_buffer)

-- 打开终端
keymap.set("n", "<leader>\\", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })


-- 切换窗口：ctrl + w + 方向键
-- 在文件树中输入a创建新的文件
