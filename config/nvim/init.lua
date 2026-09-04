require("safi.core.init")
require("safi.lazy")
require("safi.lsp")
vim.g.uni = "~/dotfiles/config"
vim.o.background = "dark"
vim.cmd([[colorscheme kanagawa]])
vim.g.uni = "~/Uni Data/Sem IV"
if vim.g.neovide then
  local function get_kitty_opacity()
    local home = os.getenv("HOME")
    local kitty_conf = home .. "/.config/kitty/kitty.conf"

    -- find the include line to get the theme path
    local f = io.open(kitty_conf, "r")
    if not f then return 1.0 end
    local theme_file
    for line in f:lines() do
      local inc = line:match("^include%s+(.+)$")
      if inc then
        theme_file = home .. "/.config/kitty/" .. inc
        break
      end
    end
    f:close()

    if not theme_file then return 1.0 end

    -- read opacity from theme file
    local tf = io.open(theme_file, "r")
    if not tf then return 1.0 end
    local opacity
    for line in tf:lines() do
      local val = line:match("^background_opacity%s+(.+)$")
      if val then
        opacity = tonumber(val)
        break
      end
    end
    tf:close()

    return opacity or 1.0
  end

  vim.g.neovide_opacity = get_kitty_opacity()
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8
  vim.o.guifont = "MesloLGSDZ Nerd Font Mono:h18"
  vim.g.neovide_window_blurred = true
  vim.g.neovide_refresh_rate = 60
end
