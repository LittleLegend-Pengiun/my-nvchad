local plugins = {
  {
    "mfussenegger/nvim-lint",
    event= "VeryLazy",
    config = function ()
      require "configs.eslint"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
    end
  }
}

return plugins
