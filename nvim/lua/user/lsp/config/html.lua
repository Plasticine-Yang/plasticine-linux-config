return {
  on_setup = function(server)
    server:setup({
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        -- 禁用格式化功能，让 null-ls 的专门插件去处理格式化
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
      end,
    })
  end,
}
