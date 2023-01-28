local status, notify = pcall(require, "notify")
if not status then
  return
end

notify.setup({
  stages = "fade",
  timeout = 1000,
  render = "default",
})

vim.notify = notify
