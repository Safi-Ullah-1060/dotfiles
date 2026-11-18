-- Managed by ryoku-monitor. Scale and position are captured from the live
-- session (DPI-derived, never hardcoded); refresh is always highrr so a
-- slow-training link cannot pin a low rate. This file is regenerated on
-- every login and hotplug, so edits here are lost: put durable manual
-- overrides in ~/.config/hypr/monitors_user.lua (see monitors_user.lua.example),
-- which is loaded after this file, wins, and is never rewritten.

hl.monitor({ output = "eDP-1", mode = "highrr", position = "0x0", scale = 1.25, supports_hdr = -1 })

-- Keep GTK and XWayland apps crisp: the nearest whole scale when every
-- monitor agrees, else 1 (Wayland scales native apps fractionally itself).
hl.env("GDK_SCALE", "1")

-- Catch-all for monitors not listed above. A hotplugged display comes up at
-- its preferred mode (always valid on an untrained link, unlike highrr, which
-- errors until the link resolves; autoscale + settle then raise it to highrr),
-- placed to the right at 1x, never mirrored.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, supports_hdr = -1 })
