-- Configuration for the telescope.nvim package, used as fuzzy file finder

local is_telescope_imported, telescope = pcall(require, "telescope")
if not is_telescope_imported then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", "dist" }
  }
}
