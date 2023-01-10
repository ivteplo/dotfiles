return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Language server protocol configuration
    -- (required for smart autocompletions and better language support)
    use 'neovim/nvim-lspconfig'

    -- Autocompletions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
end)
