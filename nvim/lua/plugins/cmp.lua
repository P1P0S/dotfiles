return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local luasnip = require("luasnip")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local function formatForTailwindCSS(entry, vim_item)
      if vim_item.kind == "Color" and entry.completion_item.documentation then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
        if r then
          local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
          local group = "Tw_" .. color
          if vim.fn.hlID(group) < 1 then
            vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
          end
          vim_item.kind = "●"
          vim_item.kind_hl_group = group
          return vim_item
        end
      end
      vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
      return vim_item
    end

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
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),

      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { { name = "buffer" } },
      }),
      formatting = {
        format = lspkind.cmp_format({
          wirth_text = false,
          maxwidth = 50,
          before = function(entry, vim_item)
            vim_item = formatForTailwindCSS(entry, vim_item)
            return vim_item
          end,
        }),
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- load snippets
    require("luasnip/loaders/from_vscode").lazy_load()

    vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
  highlight CmpItemAbbr guibg=NONE
  highlight! CmpItemAbbrDeprecated guibg=NONE 
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#5E97EC
  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
  " press <Tab> to expand or jump in a snippet. These can also be mapped separately
  " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
  " -1 for jumping backwards.
  inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

  snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
  snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

  " For changing choices in choiceNodes (not strictly necessary for a basic setup).
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])
  end,
  build = "make install_jsregexp",
  dependencies = {
    {
      "onsails/lspkind.nvim",
    },
    {
      "L3MON4D3/LuaSnip",
    },
    {
      "saadparwaiz1/cmp_luasnip",
    },
    {
      "hrsh7th/cmp-buffer",
    },
    {
      "rafamadriz/friendly-snippets",
    },
  },
}
