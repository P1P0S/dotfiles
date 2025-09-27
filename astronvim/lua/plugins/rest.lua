return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "json",
        callback = function() vim.opt_local.formatprg = "jq" end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rest_nvim_result",
        callback = function(e)
          vim.keymap.set("n", "q", "<cmd>bd!<cr>", {
            buffer = e.buf,
            silent = true,
          })
        end,
      })
    end,
  },
}
