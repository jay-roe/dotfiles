return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            -- Configure language support
            ensure_installed = {"lua", "rust"},
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
  }
}
