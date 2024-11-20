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

