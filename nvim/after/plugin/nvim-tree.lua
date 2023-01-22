local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,

  view = {
    adaptive_size = true,
    --width = 20,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 24,
        height = 28,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
