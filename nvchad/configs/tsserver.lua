-- temporarily disable tsserver suggestions
require("lspconfig").tsserver.setup {
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  -- disable tsserver formatting
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
}
