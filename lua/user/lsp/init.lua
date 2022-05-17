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

require("user.lsp.null-ls")

lspconfig.sumneko_lua.setup({
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
})

lspconfig.clangd.setup({})
lspconfig.jsonls.setup({})
lspconfig.jdtls.setup({})
