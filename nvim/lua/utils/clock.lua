local M = {}

function M.get_current_time()
  return " " .. os.date("%H:%M")
end

local timer = vim.loop.new_timer()

timer:start(1000, 0, function()
  M.get_current_time()
end)

return M
