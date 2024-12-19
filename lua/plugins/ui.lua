return {
	-- File explorer sidebar
	{ 
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		opts = {},
		keys = {
			{ "<leader>fs", "<cmd>NvimTreeToggle<cr>", desc = "Open the explorer sidebar", mode = "n" }
		}
	},

	-- Tab bar
	{
		"romgrk/barbar.nvim",
		lazy = false,
		version = "^1.0.0",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function() 
			vim.g.barbar_auto_setup = false 
		end,
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
		keys = {
			{ '<C-p>', '<Cmd>BufferPrevious<CR>', desc = "Move to the previous buffer", mode = 'n' },
			{ '<C-n>', '<Cmd>BufferNext<CR>', desc = "Move to the next buffer", mode = 'n' },

			{ '<leader><C-p>', '<Cmd>BufferMovePrevious<CR>', desc = "Move the buffer to the left in the navigation bar", mode = 'n' },
			{ '<leader><C-n>', '<Cmd>BufferMoveNext<CR>', desc = "Move the buffer to the right in the navigation bar", mode = 'n' },

			{ '<leader>x', '<Cmd>BufferClose<CR>', desc = "Close the current buffer", mode = 'n' },

			-- Wipeout buffer
			--     :BufferWipeout
			--
			-- Close commands
			--     :BufferCloseAllButCurrent
			--     :BufferCloseAllButPinned
			--     :BufferCloseAllButCurrentOrPinned
			--     :BufferCloseBuffersLeft
			--     :BufferCloseBuffersRight
--
			-- Sort automatically by...
			--     :BufferOrderByBufferNumber
			--     :BufferOrderByDirectory
			--     :BufferOrderByLanguage
			--     :BufferOrderByWindowNumber
			--
			-- Other:
			--     :BarbarEnable - enables barbar (enabled by default)
			--     :BarbarDisable - very bad command, should never be used
		}
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

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { 
			"nvim-lua/plenary.nvim", 
			"nvim-telescope/telescope-ui-select.nvim"
		},
		keys = {
			{ "<leader>actions", vim.lsp.buf.code_action, mode = "n" },
			{ "<leader>files", "<cmd>Telescope find_files<cr>", mode = "n" },
			{ "<leader>grep", "<cmd>Telescope live_grep<cr>", mode = "n" },
			{ "<leader>buffers", "<cmd>Telescope buffers<cr>", mode = "n" },
			{ "<leader>help", "<cmd>Telescope help_tags<cr>", mode = "n" },
			{ "<leader>cmd", "<cmd>Telescope commands<cr>", mode = "n" },
			{ "<leader>theme", "<cmd>Telescope colorscheme<cr>", mode = "n" },
			{ "<leader>ref", "<cmd>Telescope lsp_references<cr>", mode = "n" },
			{ "<leader>symbols", "<cmd>Telescope lsp_document_symbols<cr>", mode = "n" },
			{ "<leader>wssymbols", "<cmd>Telescope lsp_workspace_symbols<cr>", mode = "n" },
			{ "<leader>impl", "<cmd>Telescope lsp_implementations<cr>", mode = "n" },
			{ "<leader>def", "<cmd>Telescope lsp_definitions<cr>", mode = "n" },
			{ "<leader>typedef", "<cmd>Telescope lsp_type_definitions<cr>", mode = "n" },
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
		end,
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
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
		keys = {
			{ "<leader>git", "<cmd>Neogit<cr>", mode = "n", desc = "Open Neogit" }
		}
	}
}
