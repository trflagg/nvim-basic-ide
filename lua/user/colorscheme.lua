local colorscheme = "one"

vim.o.background='light'

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
