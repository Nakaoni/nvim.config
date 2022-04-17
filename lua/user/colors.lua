local colorscheme = "darkplus"
local colorscheme = "vscode"

vim.g.vscode_style = "dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. "not installed !")
end

