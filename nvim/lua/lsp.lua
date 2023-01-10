-- Setup for language support using language server protocol

local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local is_on_windows = package.config:sub(1,1) == "\\"
local tsserver_executable = is_on_windows and "typescript-language-server.cmd" or "typescript-language-server"

lspconfig.tsserver.setup {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { tsserver_executable, "--stdio" },
    capabilities = capabilities,
}
