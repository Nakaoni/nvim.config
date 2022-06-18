local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_highlighting = false,
    },
    rainbow = {
        enable = true,
        colors = {
            "#87cefa", -- LightSkyBlue
            "#da70d6", -- Orchid
            "#ffd700", -- Gold
        }
    },
    autotag = {
        enable = true,
    }
}

local status_p_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not status_p_ok then
    return
end

local f2p = parsers.filetype_to_parsername

f2p.twig = "html"
