local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

mason.setup()
mason_lspconfig.setup()

local lsp = require "lspconfig"
local lsp_zero = require("lsp-zero").preset({})
local lightbulb = require "nvim-lightbulb"

lsp_zero.on_attach(function(client, buffer)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = buffer })
end)

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


mason_lspconfig.setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		lsp[server_name].setup {
			--capabilities = capabilities
		}
	end,
	---- Next, you can provide a dedicated handler for specific servers.
	---- For example, a handler override for the `rust_analyzer`:
	--["rust_analyzer"] = function ()
	--	require("rust-tools").setup {}
	--end
}

lsp_zero.setup()

-- Show a lightbulb icon when there are code actions available
lightbulb.setup {
	autocmd = { enabled = true }
}

-- Custom keybindings for autocompletions
local cmp = require "cmp"
cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
	}
})

-- LSP error pane
local trouble = require "trouble"
vim.keymap.set("n", "<leader>errors", function() trouble.open() end)

