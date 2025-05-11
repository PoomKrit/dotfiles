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
        "jsonls",
        "jqls",
      },
      handlers = {
        -- default
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["terraformls"] = function()
          lspconfig["terraformls"].setup({
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = true
            end,
            filetypes = { "terraform", "tf", "hcl" },
            init_options = {
              terraform = {
                path = "/opt/homebrew/bin/terraform",
                experimentalFeatures = {
                  validateOnSave = true,
                  completion = true,
                },
              },
            },
          })
        end,

        ["dockerls"] = function()
          lspconfig["dockerls"].setup({
            capabilities = capabilities,
            on_attach = function()
              print("Docker language server attached!")
            end,
            filetypes = { "dockerfile", "Dockerfile" },
          })
        end,

        ["bashls"] = function()
          lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = function()
              print("Bash language server attached!")
            end,
            filetypes = { "sh", "bash", "zsh" },
            root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
          })
        end,

        ["svelte"] = function()
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,

        ["graphql"] = function()
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,

        ["emmet_ls"] = function()
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = {
              "html", "typescriptreact", "javascriptreact",
              "css", "sass", "scss", "less", "svelte"
            },
          })
        end,

        ["lua_ls"] = function()
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,

        ["yamlls"] = function()
          lspconfig["yamlls"].setup({
            capabilities = capabilities,
            settings = {
              yaml = {
                schemaStore = {
                  enable = true,
                  url = "https://www.schemastore.org/api/json/catalog.json",
                },
                validate = true,
                completion = true,
                format = { enable = true },
                foldingRange = { enable = false },
              },
            },
          })
        end,

        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "basic",
                },
              },
            },
          })
        end,
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
