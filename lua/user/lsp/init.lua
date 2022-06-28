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

local function loadDefaultConfig(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
    end
end

-- For html, css, json, eslint, run: npm i -g vscode-langservers-extracted
local servers = {
    sumneko_lua = {
        on_attach = function(client)
            loadDefaultConfig(client)
        end,
        settings = {
            Lua = {
                format = {
                    enable = true,
                },
                diagnostics = {
                    globals = { "vim", "augroup", "bufnr" },
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
    intelephense = {
        on_attach = function(client)
            loadDefaultConfig(client)
        end,
    },
    phpactor = {},
    html = {},
    cssls = {},
    eslint = {},
    jsonls = {},
    yamlls = {},
    tsserver = {
        on_attach = function(client)
            loadDefaultConfig(client)
        end,
        settings = {
            typescript = {
                format = {
                    indentSize = 2,
                }
            },
            javascript = {
                format = {
                    indentSize = 2,
                }
            }
        }
    },
    tailwindcss = {}
}

for server, setup_config in pairs(servers) do
    lspconfig[server].setup(setup_config)
end

-- require("user.lsp.null-ls")
