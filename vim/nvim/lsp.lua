-- Setup for language support using language server protocol

local is_lspconfig_loaded, lspconfig = pcall(require, 'lspconfig')
local is_cmp_nvim_lsp_loaded, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not is_lspconfig_loaded or not is_cmp_nvim_lsp_loaded then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local is_on_windows = package.config:sub(1,1) == "\\"
local tsserver_executable = is_on_windows and "typescript-language-server.cmd" or "typescript-language-server"

lspconfig.tsserver.setup {
    cmd = { tsserver_executable, "--stdio" },
    capabilities = capabilities,
}

lspconfig.ruby_ls.setup {
    capabilities = capabilities,
}
