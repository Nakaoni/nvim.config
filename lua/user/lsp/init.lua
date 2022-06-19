local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

lsp_installer.setup({
    automatic_installation = true,
})

local status_lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig_ok then
    return
end

local handlers = require("user.lsp.handlers")
handlers.setup()

-- For html, css, json, eslint, run: npm i -g vscode-langservers-extracted
local servers = {
    sumneko_lua = {
        settings = {
            Lua = {
                format = {
                    enable = true,
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    },
    clangd = {},
    emmet_ls = {},
    volar = {},
    intelephense = {},
    phpactor = {},
    html = {},
    cssls = {},
    eslint = {},
    jsonls = {},
    yamlls = {},
}

for server, setup_config in pairs(servers) do
    lspconfig[server].setup(setup_config)
end

require("user.lsp.null-ls")
