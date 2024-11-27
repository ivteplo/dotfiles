require("lazy").setup {
	-- Tokyo night color scheme
	{ "folke/tokyonight.nvim" },
	-- GitHub color scheme
	{ "projekt0n/github-nvim-theme" },
	-- XCode color scheme
	{ "arzg/vim-colors-xcode" },
	-- Everforest color schemes
	{ "sainnhe/everforest" },
	-- Darcula color schemes (ported from JetBrains IDEs)
	{ "doums/darcula" },

	-- Match system’s color theme
	{ 
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme xcodedarkhc")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme xcodelighthc")
			end,
		},
	},


	-- Auto-detect indentation
	{ 
		"nmac427/guess-indent.nvim" ,
		opts = {}
	},


	-- File explorer sidebar
	{ 
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		opts = {},
		init = function() 
			vim.keymap.set("n", "<leader>fs", function ()
				vim.cmd("NvimTreeToggle")
			end)
		end
	},

	-- Tab bar
	{
		"romgrk/barbar.nvim",
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			animation = true,

			-- Automatically hide the tabline when there are this many buffers left.
			-- Set to any value >=0 to enable.
			auto_hide = false,

			-- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,

			-- Enables/disable clickable tabs
			--  - left-click: go to buffer
			--  - middle-click: delete buffer
			clickable = true,

			-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
			-- Valid options are 'left' (the default), 'previous', and 'right'
			focus_on_close = "previous",

			-- If true, new buffers will be inserted at the start/end of the list.
			-- Default is to insert after current buffer.
			insert_at_end = true,
			insert_at_start = false,
		},
		init = function()
			-- Move to previous/next
			vim.keymap.set('n', '<C-p>', '<Cmd>BufferPrevious<CR>')
			vim.keymap.set('n', '<C-n>', '<Cmd>BufferNext<CR>')

			-- Re-order to previous/next
			vim.keymap.set('n', '<leader><C-p>', '<Cmd>BufferMovePrevious<CR>')
			vim.keymap.set('n', '<leader><C-n>', '<Cmd>BufferMoveNext<CR>')

			-- Close buffer
			vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>')

			-- Wipeout buffer
			--     :BufferWipeout
			--
			-- Close commands
			--     :BufferCloseAllButCurrent
			--     :BufferCloseAllButPinned
			--     :BufferCloseAllButCurrentOrPinned
			--     :BufferCloseBuffersLeft
			--     :BufferCloseBuffersRight

			-- Sort automatically by...
			--     :BufferOrderByBufferNumber
			--     :BufferOrderByDirectory
			--     :BufferOrderByLanguage
			--     :BufferOrderByWindowNumber
			--
			-- Other:
			--     :BarbarEnable - enables barbar (enabled by default)
			--     :BarbarDisable - very bad command, should never be used
		end
	},

	-- Activity bar (in the bottom)
	{ 
		"nvim-lualine/lualine.nvim" ,
		opts = {
			options = {
				component_separators = "",
				section_separators = ""
			},
			sections = {
				lualine_a = {"mode"},
				lualine_b = {"branch", "diff", "diagnostics"},
				lualine_c = {"filename", "filesize"},
				lualine_x = {"encoding", "fileformat", "filetype"},
				lualine_y = {},
				lualine_z = {"location", "selectioncount"}
			}
		}
	},

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
			local capabilities = vim.lsp.protocol.make_client_capabilities()
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
							exportPdf = "onType",
							outputPath = "$root/build/$dir/$name"
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
						mapping = {
							-- `Enter` key to confirm completion
							["<CR>"] = cmp.mapping.confirm({ select = false }),

							-- Ctrl+Space to trigger completion menu
							["<C-Space>"] = cmp.mapping.complete(),
						}
					}
				end
			},

			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" }
		},
		init = function()
			local lsp_zero = require("lsp-zero").preset({})

			lsp_zero.on_attach(function(client, buffer)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = buffer })
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
				close = "q", -- close the list
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
		init = function()
			vim.keymap.set("n", "<leader>errors", function() trouble.open { new = false, refresh = true } end)
		end
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { 
			"nvim-lua/plenary.nvim", 
			"nvim-telescope/telescope-ui-select.nvim" 
		},
		config = function() 
			local telescope_builtin = require "telescope.builtin"
			local themes = require "telescope.themes"
			local telescope = require "telescope"

			telescope.setup {
				defaults = themes.get_dropdown {},
				extensions = {
					["ui-select"] = {
						themes.get_cursor {}
					}
				}
			}

			telescope.load_extension("ui-select")

			vim.keymap.set("n", "<leader>files", telescope_builtin.find_files, {})
			vim.keymap.set("n", "<leader>grep", telescope_builtin.live_grep, {})
			vim.keymap.set("n", "<leader>buffers", telescope_builtin.buffers, {})
			vim.keymap.set("n", "<leader>help", telescope_builtin.help_tags, {})
			vim.keymap.set("n", "<leader>cmd", telescope_builtin.commands, {})
			vim.keymap.set("n", "<leader>theme", telescope_builtin.colorscheme, {})
			vim.keymap.set("n", "<leader>actions", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>ref", telescope_builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>symbols", telescope_builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>wssymbols", telescope_builtin.lsp_workspace_symbols, {})
			vim.keymap.set("n", "<leader>impl", telescope_builtin.lsp_implementations, {})
			vim.keymap.set("n", "<leader>def", telescope_builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>typedef", telescope_builtin.lsp_type_definitions, {})
		end
	},

	{ 
		"akinsho/toggleterm.nvim", 
		version = "*", 
		config = true,
		opts = {
			size = 10,
			open_mapping = "<leader>term",

			-- hide the number column in toggleterm buffers
			hide_numbers = true,

			-- when neovim changes it current directory the terminal will change it's own when next it's opened
			autochdir = true,

			start_in_insert = true,
			-- whether or not the open mapping applies in insert mode
			insert_mappings = true,

			-- whether or not the open mapping applies in the opened terminals
			terminal_mappings = true,
			persist_size = true,
			-- if set to true (default) the previous terminal mode will be remembered
			persist_mode = true,
			direction = "horizontal",

			-- close the terminal window when the process exits
			close_on_exit = true,
			 -- Change the default shell. Can be a string or a function returning a string
			shell = vim.o.shell,
			-- automatically scroll to the bottom on terminal output
			auto_scroll = true,
		}
	}
}
