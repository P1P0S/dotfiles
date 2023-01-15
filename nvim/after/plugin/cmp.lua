local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local winhighlight = {
  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(winhighlight),
    documentation = cmp.config.window.bordered(winhighlight),
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
    }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
  }),
  formatting = {
    format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 }),
  },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault

  highlight CmpItemAbbr guibg=NONE
  highlight! CmpItemAbbrDeprecated guibg=NONE 
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#5E97EC
  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
]])
