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


	-- File explorer sidebar
	{ "preservim/nerdtree" },

	-- Icons for the file explorer
	{ "ryanoasis/vim-devicons", after = "preservim/nerdtree" },
	{ "tiagofumo/vim-nerdtree-syntax-highlight", after = "ryanoasis/vim-devicons" },

	-- Tab bar
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

	-- Activity bar (in the bottom)
	{ "nvim-lualine/lualine.nvim" },

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Default LSP configurations
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- Default LSP settings for different languages
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" }
		}
	},
	-- Show light bulb when there are code actions available
	{ "kosayoda/nvim-lightbulb" },
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
	},

	{
		"nvim-telescope/telescope.nvim", tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },

	{ "akinsho/toggleterm.nvim", version = "*", config = true }
}
