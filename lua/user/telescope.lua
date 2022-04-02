local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {
        media_files = {}
    },
})

