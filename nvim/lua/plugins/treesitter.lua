return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local langs = { "markdown", "javascript", "tsx", "lua", "json", "css", "vim", "html" }
    require("nvim-treesitter.configs").setup({
      indent = {
        enable = false,
      },
      highlight = {
        enable = true,
        --disable = { "html" },
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = langs,
      autotag = {
        enable = true,
      },
    })
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx", "javascriptreact" }
  end,
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
      lazy = true,
    },
  },
}
