--@diagnostic disable: undefined-global
local M = {}
local autocmd = vim.api.nvim_create_autocmd

M.gitsigns = function()
  autocmd({ "BufReadPre" }, {
    group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
    callback = function()
      vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
        vim.schedule(function()
          require("lazy").load({ plugins = "gitsigns.nvim" })
        end)
      end
    end,
  })
end

M.bufferline = function()
  autocmd({ "BufReadPre" }, {
    callback = function()
      local current_bufnr = vim.api.nvim_get_current_buf()
      if current_bufnr ~= 1 then
        vim.schedule(function()
          require("lazy").load({ plugins = "nvim-bufferline.lua" })
        end)
      end
    end,
  })
end

M.dashboard = function()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
        vim.cmd("Dashboard")
      end
    end,
  })
end

M.telescope_cmds = {
  "Telescope find_files",
  "Telescope live_grep",
  "Telescope buffers",
  "Telescope help_tags",
  "Telescope colorscheme",
  "Telescope resume",
  "Telescope diagnostics",
}

return M
