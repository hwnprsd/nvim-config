local null_ls = require 'null-ls'

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  }
end

return function()
  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.diagnostics.solhint,
    },
    -- Format on Save
    on_attach = function(client, bufnr)
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
          end,
        })
      end
    end,
  }
end
