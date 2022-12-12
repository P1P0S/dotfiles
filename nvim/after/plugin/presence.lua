require("presence"):setup({
  -- General options
  auto_update = true,
  neovim_image_text = "Hello strange 👽",
  enable_line_number = false,
  buttons = true,

  editing_text = "Editing %s",
  file_explorer_text = "Browsing %s",
  git_commit_text = "Committing changes",
  plugin_manager_text = "Managing plugins",
  reading_text = "Reading %s",
  workspace_text = "Working on %s",
  line_number_text = "Line %s out of %s",
})
