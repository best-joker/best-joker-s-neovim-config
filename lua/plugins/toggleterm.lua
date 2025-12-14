local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return
end

toggleterm.setup({
  size = 15,
  open_mapping = [[<C-\>]],
  -- direction = "horizontal",类似于vscode的底部终端
  -- direction = "vertical",
  direction = "float",
  shade_terminals = true,
  shell = "pwsh",  -- 使用 PowerShell 7
})
