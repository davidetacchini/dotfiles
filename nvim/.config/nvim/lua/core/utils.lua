local function generate_random_password(length)
  length = length or 50
  local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
  local n = #charset
  local chars = {}
  for i = 1, n do
    chars[i] = charset:sub(i, i)
  end
  local threshold = math.floor(256 / n) * n

  local fd = assert(vim.uv.fs_open("/dev/urandom", "r", 438))
  local ok, bytes = pcall(function()
    local password = {}
    while #password < length do
      local buf = assert(vim.uv.fs_read(fd, 128, 0))
      for i = 1, #buf do
        local b = string.byte(buf, i)
        if b < threshold then
          password[#password + 1] = chars[(b % n) + 1]
          if #password >= length then
            break
          end
        end
      end
    end
    return table.concat(password, "")
  end)
  vim.uv.fs_close(fd)

  if not ok then
    error(bytes)
  end

  vim.fn.setreg("+", bytes)
  vim.fn.setreg("*", bytes)
  vim.notify("Password copied to clipboard", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("GeneratePassword", function(opts)
  local length = tonumber(opts.args) or 50
  generate_random_password(length)
end, { nargs = "?" })
