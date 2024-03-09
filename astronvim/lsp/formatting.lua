return {
  format_on_save = false,
  filter = function(client)
    if client.name == "tsserver" then return false end
    return client.name == "null-ls"
  end,
}
