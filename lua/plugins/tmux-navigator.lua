-- 禁用默认快捷键
vim.g.tmux_navigator_no_mappings = 1

-- 自定义快捷键
vim.keymap.set('n', '<leader><Left>', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<leader><Down>', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', '<leader><Up>', ':TmuxNavigateUp<CR>')
vim.keymap.set('n', '<leader><Right>', ':TmuxNavigateRight<CR>')
