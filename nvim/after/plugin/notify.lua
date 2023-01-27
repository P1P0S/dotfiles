local status, notify = pcall(require, "notify")
if not status then
  return
end

notify.setup({
  stages = "slide",
})

vim.notify = notify
