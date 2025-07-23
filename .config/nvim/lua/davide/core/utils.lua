local seeded = false

local function generate_random_password(length)
  length = length or 50
  if not seeded then
    math.randomseed(os.time() + vim.loop.hrtime())
    seeded = true
  end
  local chars = {}
  for i = 33, 126 do
    local char = string.char(i)
    if char ~= "'" and char ~= '"' then
      table.insert(chars, char)
    end
  end

  local password = {}
  for _ = 1, length do
    local random_index = math.random(#chars)
    table.insert(password, chars[random_index])
  end

  local final_password = table.concat(password, "")
  vim.fn.setreg("+", final_password)
  vim.fn.setreg("*", final_password)
  print("Generated password (copied to clipboard): " .. final_password)
end

-- Create neovim command
vim.api.nvim_create_user_command("GeneratePassword", function(opts)
  local length = tonumber(opts.args) or 50
  generate_random_password(length)
end, { nargs = "?" })
