return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")
      local mason_registry = require("mason-registry")
      local python_debug_pkg = mason_registry.get_package("debugpy")
      local python_debug_path = python_debug_pkg:get_install_path()
      dap_python.setup(python_debug_path)
      for _, language in ipairs({ "python" }) do
        dap.configurations[language] = {
          {
            type = "python",
            request = "launch",
            name = "Launch file (" .. language .. ")",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
