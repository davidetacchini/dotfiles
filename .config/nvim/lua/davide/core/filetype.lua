local function is_django_project(cwd)
  local indicators = {
    "**/manage.py",
    "**/settings.py",
    "**/urls.py",
    "**/wsgi.py",
    "**/asgi.py",
  }

  local found = 0
  for _, pattern in ipairs(indicators) do
    if #vim.fn.globpath(cwd, pattern, false, true) > 0 then
      found = found + 1
    end
  end

  return found >= 3
end

-- set different indentation for specified file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html,css,scss,javascript,typescript,javascriptreact,typescriptreact,htmldjango,lua,json,yaml",
  callback = function()
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- detected whehter is a Django file or not
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html",
  callback = function()
    local cwd = vim.fn.getcwd()
    if is_django_project(cwd) then
      vim.opt_local.filetype = "htmldjango"
    end
  end,
})
