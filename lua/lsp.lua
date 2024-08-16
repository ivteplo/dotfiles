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

lsp.lua_ls.setup {
	capabilities = capabilities,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path.."/.luarc.json") and not vim.loop.fs_stat(path.."/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT"
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					library = { vim.env.VIMRUNTIME }
					-- or pull in all of "runtimepath". NOTE: this is a lot slower
					-- library = vim.api.nvim_get_runtime_file("", true)
				}
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
}

lsp.html.setup { capabilities = capabilities }
lsp.cssls.setup { capabilities = capabilities }
lsp.emmet_language_server.setup{ capabilities = capabilities }
lsp.tsserver.setup { capabilities = capabilities}

lsp.gopls.setup { capabilities = capabilities }

lsp.csharp_ls.setup { capabilities = capabilities }


local util = require 'lspconfig/util'
lsp.pyright.setup {
	capabilities = capabilities,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(fname)
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'pyrightconfig.json',
        }
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = false,
            },
        },
    },
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

