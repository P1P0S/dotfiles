local function getWeekday()
  local day = os.date "%A"
  return day
end

return getWeekday
