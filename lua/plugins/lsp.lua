return {
	-- LSP servers
	{ 
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
		init = function()
			local lsp = require "lspconfig"

			-- Enable (broadcasting) snippet capability for completion
			--local capabilities = vim.lsp.protocol.make_client_capabilities()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			require("mason-lspconfig").setup_handlers {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function (server_name) -- default handler (optional)
					lsp[server_name].setup {
						capabilities = capabilities,
						root_dir = function (filename, bufnr)
							return vim.fn.getcwd()
						end
					}
				end,
				["tinymist"] = function ()
					lsp.tinymist.setup {
						capabilities = capabilities,
						root_dir = function (filename, bufnr)
							return vim.fn.getcwd()
						end,
						settings = {
							--exportPdf = "onType",
							--outputPath = "$root/$dir/$name"
						}
					}
				end
			}
		end
	},
	{ "neovim/nvim-lspconfig" },
	-- Default LSP configurations
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- Default LSP settings for different languages
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ 
				"hrsh7th/nvim-cmp" ,
				config = function()
					local cmp = require("cmp")
					cmp.setup {
						sources = {
							{ name = "nvim_lsp" },
							{ name = "luasnip" },
							{ name = "buffer" },
						},
						expand = function(args)
							vim.snippet.expand(args.body)
							--require('luasnip').lsp_expand(args.body)
						end,
						mapping = cmp.mapping.preset.insert({
							-- `Enter` key to confirm completion
							["<CR>"] = cmp.mapping.confirm({ select = false }),

							--<Ctrl-n>: Go to the next item in the completion menu, or trigger completion menu.
							--<Ctrl-p>: Go to the previous item in the completion menu, or trigger completion menu.

							['<C-u>'] = cmp.mapping.scroll_docs(-4),
							['<C-d>'] = cmp.mapping.scroll_docs(4),   
						}),
					}
				end
			},

			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" }
		},
		init = function()
			local lsp_zero = require("lsp-zero").preset({})

			lsp_zero.on_attach(function(client, buffnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = buffnr })
			end)

			lsp_zero.setup {}
		end
	},
	-- Show light bulb when there are code actions available
	{ 
		"kosayoda/nvim-lightbulb",
		opts = {
			autocmd = { enabled = true }
		}
	},

	-- Separate pane with LSP errors and warnings
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			action_keys = {
				-- map to {} to remove a mapping, for example:
				-- close = {},
				close = "<leader>x", -- close the list
				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
				refresh = "r", -- manually refresh
				jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
				open_split = { "<c-x>" }, -- open buffer in new split
				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
				open_tab = { "<c-t>" }, -- open buffer in new tab
				jump_close = {"o"}, -- jump to the diagnostic and close the list
				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
				switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
				toggle_preview = "P", -- toggle auto_preview
				hover = "K", -- opens a small popup with the full multiline message
				preview = "p", -- preview the diagnostic location
				open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
				close_folds = {"zM", "zm"}, -- close all folds
				open_folds = {"zR", "zr"}, -- open all folds
				toggle_fold = {"zA", "za"}, -- toggle fold of current file
				previous = "k", -- previous item
				next = "j", -- next item
				help = "?" -- help menu	
			}
		},
		keys = {
			{
			  "<leader>errors",
			  "<cmd>Trouble diagnostics toggle<cr>",
			  desc = "Diagnostics (Trouble)",
			}
		},
	},
}

