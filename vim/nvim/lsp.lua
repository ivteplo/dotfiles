-- Setup for language support using language server protocol

local is_cmp_loaded, cmp = pcall(require, 'cmp')
local is_lspconfig_loaded, nvim_lsp = pcall(require, 'lspconfig')
local is_cmp_nvim_lsp_loaded, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not is_cmp_loaded or not is_lspconfig_loaded or not is_cmp_nvim_lsp_loaded then
  return
end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    })
  }),
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' }
  }
})

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}


local is_on_windows = package.config:sub(1,1) == "\\"
local tsserver_executable = is_on_windows and "typescript-language-server.cmd" or "typescript-language-server"

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  cmd = { tsserver_executable, "--stdio" },
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
}

nvim_lsp.ruby_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
