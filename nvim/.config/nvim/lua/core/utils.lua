local function generate_random_password(length)
  length = length or 50
  local chars = {}
  for i = 33, 126 do
    local char = string.char(i)
    if char ~= "'" and char ~= '"' and char ~= "\\" then
      table.insert(chars, char)
    end
  end

  local fd = assert(vim.uv.fs_open("/dev/urandom", "r", 438))
  local bytes = assert(vim.uv.fs_read(fd, length, 0))
  vim.uv.fs_close(fd)

  local password = {}
  for i = 1, length do
    local idx = (string.byte(bytes, i) % #chars) + 1
    table.insert(password, chars[idx])
  end

  local final_password = table.concat(password, "")
  vim.fn.setreg("+", final_password)
  vim.fn.setreg("*", final_password)
  vim.notify("Password copied to clipboard", vim.log.levels.INFO)
end

-- Create neovim command
vim.api.nvim_create_user_command("GeneratePassword", function(opts)
  local length = tonumber(opts.args) or 50
  generate_random_password(length)
end, { nargs = "?" })
