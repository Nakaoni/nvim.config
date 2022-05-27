local shade_status_ok, shade = pcall(require, "shade")
if not shade_status_ok then
    return
end

shade.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  -- keys = {
  --   toggle = '<Leader>s',
  -- }
})
