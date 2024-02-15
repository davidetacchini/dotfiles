local colorscheme = "onedark"

local status_ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
