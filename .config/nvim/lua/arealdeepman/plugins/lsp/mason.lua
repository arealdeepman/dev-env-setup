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

    -- import mason tool installer
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
        "bashls", -- bash language server
        "dockerls", -- docker language server 
        "docker_compose_language_service", -- docker compose language server
        "gopls", -- google's golang language server
        "groovyls", -- groovy language server
        "helm_ls", -- helm language server
        "jsonls", -- json language server
        "lua_ls", -- lua language server
        "marksman", --markdown language server
        "pyright", -- python language server
        "terraformls", -- terraform language server
        "tsserver", -- typescript language server
        "yamlls", -- yaml language server
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "tflint", -- terraform linter
        "eslint_d", -- js linter
      },
    })
  end,
}
