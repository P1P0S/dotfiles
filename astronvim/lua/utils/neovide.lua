if vim.g.neovide == true then
  -- disable mini.animate
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.o.guifont = "IosevkaTerm Nerd Font:h11"
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  vim.opt.linespace = -1
  vim.g.neovide_scale_factor = 0.9
  vim.g.neovide_padding_top = 1
  vim.g.neovide_padding_bottom = 1
  vim.g.neovide_padding_right = 1
  vim.g.neovide_padding_left = 1
  -- vim.g.neovide_transparency = 0.8
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_scroll_animation_far_lines = 1
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_underline_stroke_scale = 1.0
  vim.g.neovide_theme = "auto"
  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_profiler = false -- enables the profiler, which shows a frametime graph in the upper left corner.
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "railgun" -- torpedo, pixiedust, sonicboom, ripple, wireframe

  local home = os.getenv "HOME"
  local additional_paths = {
    home .. "/.asdf/shims",
    home .. "/.cargo/bin",
  }
  vim.env.PATH = table.concat(additional_paths, ":") .. ":" .. vim.env.PATH

  -- vim.api.nvim_create_autocmd("VimEnter", { command = "ProjectExplorer" })
end
