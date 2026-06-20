local gruvbox_material_palette = {
  -- Backgrounds
  hard_bg   = "#1d2021",
  base      = "#282828",
  mantle    = "#32302f",
  crust     = "#1d2021",
  surface0  = "#3c3836",
  surface1  = "#504945",
  surface2  = "#665c54",

  -- Foregrounds / Overlays
  text      = "#d4be98",
  subtext1  = "#ddc7a1",
  subtext0  = "#bdae93",
  overlay2  = "#a89984",
  overlay1  = "#928374",
  overlay0  = "#7c6f64",

  -- Colors (Material variant)
  red       = "#ea6962",
  maroon    = "#e78a4e", -- no direct maroon; using orange-red
  peach     = "#e78a4e",
  yellow    = "#d8a657",
  green     = "#a9b665",
  teal      = "#89b482",
  sky       = "#7daea3",
  sapphire  = "#7daea3", -- no distinct sapphire; mapped to aqua
  blue      = "#7daea3",
  lavender  = "#d3869b", -- mapped to purple-pink
  mauve     = "#d3869b",
  pink      = "#d3869b",
  flamingo  = "#ea6962", -- mapped to red-ish
  rosewater = "#e78a4e", -- no rosewater; mapped to orange
}

-- Plugins
require("full-border"):setup({
  type = ui.Border.ROUNDED,
})

require("zoxide"):setup({
  update_db = true,
})

require("session"):setup({
  sync_yanked = true,
})

require("yatline"):setup({
  section_separator = { open = "", close = "" },
  inverse_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },

  style_a = {
    fg = gruvbox_material_palette.mantle,
    bg_mode = {
      normal = gruvbox_material_palette.blue,
      select = gruvbox_material_palette.mauve,
      un_set = gruvbox_material_palette.red,
    },
  },
  style_b = { bg = gruvbox_material_palette.surface0, fg = gruvbox_material_palette.text },
  style_c = { bg = gruvbox_material_palette.base, fg = gruvbox_material_palette.text },

  permissions_t_fg = gruvbox_material_palette.green,
  permissions_r_fg = gruvbox_material_palette.yellow,
  permissions_w_fg = gruvbox_material_palette.red,
  permissions_x_fg = gruvbox_material_palette.sky,
  permissions_s_fg = gruvbox_material_palette.lavender,

  selected = { icon = "󰻭", fg = gruvbox_material_palette.yellow },
  copied = { icon = "", fg = gruvbox_material_palette.green },
  cut = { icon = "", fg = gruvbox_material_palette.red },

  total = { icon = "", fg = gruvbox_material_palette.yellow },
  succ = { icon = "", fg = gruvbox_material_palette.green },
  fail = { icon = "", fg = gruvbox_material_palette.red },
  found = { icon = "", fg = gruvbox_material_palette.blue },
  processed = { icon = "", fg = gruvbox_material_palette.green },

  tab_width = 20,
  tab_use_inverse = true,

  show_background = false,

  display_header_line = true,
  display_status_line = true,

  header_line = {
    left = {
      section_a = {
        { type = "line", custom = false, name = "tabs", params = { "left" } },
      },
      section_b = {
        { type = "coloreds", custom = false, name = "githead" },
      },
      section_c = {},
    },
    right = {
      section_a = {
        { type = "string", custom = false, name = "tab_path" },
      },
      section_b = {
        { type = "coloreds", custom = false, name = "task_workload" },
      },
      section_c = {
        { type = "coloreds", custom = false, name = "task_states" },
      },
    },
  },

  status_line = {
    left = {
      section_a = {
        { type = "string", custom = false, name = "tab_mode" },
      },
      section_b = {
        { type = "string", custom = false, name = "hovered_size" },
      },
      section_c = {
        { type = "string",   custom = false, name = "hovered_name" },
        { type = "coloreds", custom = false, name = "count" },
      },
    },
    right = {
      section_a = {
        { type = "string", custom = false, name = "cursor_position" },
      },
      section_b = {
        { type = "string", custom = false, name = "cursor_percentage" },
      },
      section_c = {
        { type = "string",   custom = false, name = "hovered_file_extension", params = { true } },
        { type = "coloreds", custom = false, name = "permissions" },
      },
    },
  },
})

require("yatline-githead"):setup({
  show_branch = true,
  branch_prefix = "",
  branch_symbol = "",
  branch_borders = "",

  commit_symbol = " ",

  show_stashes = true,
  stashes_symbol = " ",

  show_state = true,
  show_state_prefix = true,
  state_symbol = "󱅉",

  show_staged = true,
  staged_symbol = " ",

  show_unstaged = true,
  unstaged_symbol = " ",

  show_untracked = true,
  untracked_symbol = " ",

  prefix_color = gruvbox_material_palette.pink,
  branch_color = gruvbox_material_palette.pink,
  commit_color = gruvbox_material_palette.mauve,
  stashes_color = gruvbox_material_palette.teal,
  state_color = gruvbox_material_palette.lavender,
  staged_color = gruvbox_material_palette.green,
  unstaged_color = gruvbox_material_palette.yellow,
  untracked_color = gruvbox_material_palette.pink,
})

require("git"):setup()
