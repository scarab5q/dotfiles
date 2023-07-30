return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --- @type TroubleOptions
    opts = {

      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    keys = {
      {
        "<leader>xx",
        mode = { "n" },
        function() require("trouble").open() end,
        desc =
        "Trouble Open"
      },
      {
        "<leader>xw",
        mode = { "n" },
        function() require("trouble").open("workspace_diagnostics") end,
        desc =
        "Trouble Workspace Diagnostics"
      },
      {
        "<leader>xd",
        mode = { "n" },
        function() require("trouble").open("document_diagnostics") end,
        desc =
        "Trouble Document Diagnostics"
      },
      { "<leader>xq", mode = { "n" }, function() require("trouble").open("quickfix") end, desc = "Trouble Quickfix" },
      {
        "<leader>xl",
        mode = { "n" },
        function() require("trouble").open("loclist") end,
        desc =
        " Trouble Location List"
      },
    }

  },
  "folke/flash.nvim",
  event = "VeryLazy",
  ---type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    {
      "<leader>ss",
      mode = { "c" },
      function() require("flash").toggle() end,
      desc =
      "Toggle Flash Search"
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    disabled = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end

  }
}
