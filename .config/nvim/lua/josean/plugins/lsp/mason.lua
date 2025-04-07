-- For installing LSP (Language Server Protocol)

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

   local mason_tool_installer = require("mason-tool-installer")
    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "terraformls",
        "tflint",
        "ansiblels",
        "bashls",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "html",
        "cssls",
        "lua_ls",
        "graphql",
        "pyright",
        "jsonnet_ls",
        "jsonlint",
        "jsonld_ls",
        "json-to-struct",
        "jsonls",
        "jqls",
        "jq",
        "fixjson",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- "isort", -- python formatter
        -- "black", -- python formatter
        -- "pylint", -- python linter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- js linter
        "tflint", -- terraform linter
        "tfsec", -- terraform security scanner
        "hadolint", -- dockerfile linter
      },
    })
  end,
}
