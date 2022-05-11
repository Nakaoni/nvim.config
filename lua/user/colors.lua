-- local colorscheme = "darkplus"
-- local colorscheme = "vscode"
-- local colorscheme = "github-colors"
-- vim.g.vscode_style = "dark"

-- -- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--
-- if not status_ok then
--     vim.notify("Colorscheme " .. colorscheme .. "not installed !")
-- end

-------------------------------------------
-- local colorscheme = "github-theme"
--
-- local status_ok, theme = pcall(require, colorscheme)
-- if not status_ok then
--     vim.notify("Colorscheme " .. colorscheme .. " not installed !")
-- end
--
-- theme.setup({
--     theme_style = "dark",
--     comment_style = "italic",
--     keyword_style = "NONE",
--     function_style = "NONE",
--     variable_style = "NONE",
--     dark_sidebar = false,
-- })
-------------------------------------------

local colorscheme = "rose-pine"

local status_ok, theme = pcall(require, colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not installed !")
end

theme.setup({
    dark_variant = "moon",
    disable_italics = true,
})

vim.cmd("colorscheme rose-pine")
