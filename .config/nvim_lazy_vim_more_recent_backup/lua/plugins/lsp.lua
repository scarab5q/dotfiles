return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
        keys = { { "<leader>jb", "<cmd>Navbuddy<cr>", desc = "Navbuddy" } },
      },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- sourcekit will be automatically installed with mason and loaded with lspconfig
        sourcekit = {},
        zls = {},
        -- ruff_lsp = {},
        pyright = {},
      },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      },
    },
  },

  { "liuchengxu/vista.vim" },

  -- language specific extension modules
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.nodejs" },
  -- { import = "plugins.extras.lang.python" },
}
