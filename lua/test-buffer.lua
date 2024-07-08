local maps = {fennel = {extension = "fnl", comment = ";"}, lua = {extension = "lua", comment = "--"}, python = {extension = "py", comment = "#"}}
local function set_plugin(options)
  return print(options.name)
end
local function setup_autocmd(options)
  local augroup = vim.api.nvim_create_augroup("TestBuffer", {clear = true})
  local function _1_()
    return set_plugin(options)
  end
  return vim.api.nvim_create_autocmd("VimEnter", {group = augroup, desc = "Set a fennel scratch buffer on load", once = true, callback = _1_})
end
local function setup(user_options)
  if not (vim.fn.argc() == 0) then
    return
  else
  end
  local default_options = {filetype = "fennel", name = "default-name"}
  local options = vim.tbl_extend("force", default_options, (user_options or {}))
  if (maps[options.filetype] == nil) then
    error(("Filetype " .. options.filetype .. " is not supported"))
  else
  end
  return setup_autocmd(options)
end
return {setup = setup}
