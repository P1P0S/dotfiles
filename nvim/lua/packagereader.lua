---@diagnostic disable: undefined-global
local M = {}

local buf
local handle

function M.show_scripts()
  local filePath = vim.fn.getcwd() .. "\\package.json"
  local file = io.open(filePath, "rb")

  if not file then
    vim.notify("Package.json not found", vim.log.levels.ERROR, { title = "PackageReader" })
    return
  end

  local contents = file:read("*all")
  file:close()

  local data = vim.fn.json_decode(contents)

  if not data["scripts"] then
    vim.notify("Key 'scripts' does not exist.", vim.log.levels.ERROR, { title = "PackageReader" })
    return
  end

  local scripts_exist = false
  for _ in pairs(data["scripts"]) do
    scripts_exist = true
    break
  end

  if scripts_exist then
    local script_list = {}
    for key, value in pairs(data["scripts"]) do
      table.insert(script_list, key .. ": " .. value)
    end

    local max_line_len = 0
    for _, v in ipairs(script_list) do
      max_line_len = math.max(max_line_len, #v)
    end
    local win_width = math.min(max_line_len, 30)
    local win_height = #script_list
    local current_win = vim.api.nvim_get_current_win()
    local current_win_width = vim.api.nvim_win_get_width(current_win)
    local current_win_height = vim.api.nvim_win_get_height(current_win)
    local row = math.floor((current_win_height - win_height) / 2)
    local col = math.floor((current_win_width - win_width) / 2)

    local opts = {
      style = "minimal",
      relative = "editor",
      width = win_width,
      height = win_height,
      row = row,
      col = col,
      focusable = false,
      border = "rounded",
    }

    buf = vim.api.nvim_create_buf(false, true)

    if vim.api.nvim_buf_is_valid(buf) then
      vim.api.nvim_buf_set_lines(buf, 0, -1, true, script_list)
      vim.api.nvim_buf_set_option(buf, "modifiable", false)
      vim.api.nvim_buf_set_option(buf, "swapfile", false)
      vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

      vim.api.nvim_buf_set_keymap(
        buf,
        "n",
        "q",
        ":lua require('packagereader').close()<CR>",
        { noremap = true, silent = true }
      )

      vim.api.nvim_buf_set_keymap(
        buf,
        "n",
        "<CR>",
        ":lua require('packagereader').term()<CR>",
        { noremap = true, silent = true }
      )
    end

    if handle == nil then
      handle = vim.api.nvim_open_win(buf, 0, opts)
    end
  else
    vim.notify("Key 'scripts' is empty.", vim.log.levels.WARN, { title = "PackageReader" })
  end
end

vim.api.nvim_set_keymap(
  "n",
  ";p",
  ":lua require('packagereader').show_scripts()<CR>",
  { noremap = true, silent = true }
)

function M.on_focus_lost()
  M.close()
end

function M.close()
  vim.api.nvim_win_close(handle, true)
  handle = nil
end

function M.term()
  local line = vim.api.nvim_get_current_line()
  local first_word = string.match(line, "%S+")
  local filtered_word = string.gsub(first_word, ":$", "")
  local command = "npm run " .. filtered_word
  vim.api.nvim_command("tabnew | terminal " .. command)
  vim.notify(
    string.format('Command "%s" running in a new tab', command),
    vim.log.levels.INFO,
    { title = "PackageReader" }
  )
  M.close()
end

return M
