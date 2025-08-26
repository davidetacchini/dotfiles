-- Cache for Django project detection (per working directory)
local django_cache = {}

local function is_django_project(cwd)
  -- Return cached result if available
  if django_cache[cwd] ~= nil then
    return django_cache[cwd]
  end

  -- Quick check: manage.py in project root (most common case)
  if vim.fn.filereadable(cwd .. "/manage.py") == 1 then
    django_cache[cwd] = true
    return true
  end

  -- Fallback: check parent directories (walk up tree)
  local parent = vim.fn.fnamemodify(cwd, ":h")
  if parent ~= cwd and vim.fn.filereadable(parent .. "/manage.py") == 1 then
    django_cache[cwd] = true
    return true
  end

  -- Cache negative result to avoid repeated checks
  django_cache[cwd] = false
  return false
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
