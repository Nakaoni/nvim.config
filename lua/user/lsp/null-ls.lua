local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

local sources = {
    code_actions.eslint,
    code_actions.gitsigns,
    -- completion.spell,
    completion.luasnip,
    -- completion.tags,
    diagnostics.eslint,
    diagnostics.actionlint,
    diagnostics.jsonlint,
    -- diagnostics.luacheck,
    formatting.stylua,
    formatting.eslint,
    -- formatting.fixjson,
    formatting.phpcsfixer,
    formatting.prettier,
}

null_ls.setup({
    sources = sources,
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})
