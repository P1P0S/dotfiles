local status, ts_autotag = pcall(require, "nvim-ts-autotag")
if not status then
  return
end

ts_autotag.setup({})
