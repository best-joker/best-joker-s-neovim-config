local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return
end

toggleterm.setup({
  size = 15,
  open_mapping = [[<C-\>]],
  direction = "float",
  shade_terminals = true,
  shell = "pwsh",  -- 使用 PowerShell 7
})
