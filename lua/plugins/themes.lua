return {
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
				vim.cmd("colorscheme tokyonight")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme tokyonight-day")
			end,
		},
	},
}

