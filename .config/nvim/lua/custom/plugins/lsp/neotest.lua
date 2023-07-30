return {
  'rcarriga/neotest',
  dependencies = {
    'marilari88/neotest-vitest',
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim"
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-vitest')
      }
    })
  end
}
