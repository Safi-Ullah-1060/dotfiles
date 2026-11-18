# Ryoku palette for fish and fzf. Rendered by the theme daemon; do not edit.
#
# Dropped straight into conf.d, which fish sources on its own, so nothing in the
# shipped config has to include it. Your ~/.config/fish/user.fish loads last and
# still wins.

# Syntax highlighting.
set -g fish_color_normal e1e2e8
set -g fish_color_command a2c9fe
set -g fish_color_keyword d8bde4
set -g fish_color_quote bbc7db
set -g fish_color_redirection c3c6cf
set -g fish_color_end d8bde4
set -g fish_color_error ffb4ab
set -g fish_color_param e1e2e8
set -g fish_color_option c3c6cf
set -g fish_color_comment c3c6cf
set -g fish_color_selection --background=1d4875
set -g fish_color_operator d8bde4
set -g fish_color_escape bbc7db
set -g fish_color_autosuggestion c3c6cf
set -g fish_color_cancel ffb4ab
set -g fish_color_search_match --background=1d4875
set -g fish_color_valid_path --underline

# Completion pager.
set -g fish_pager_color_progress c3c6cf
set -g fish_pager_color_prefix a2c9fe
set -g fish_pager_color_completion e1e2e8
set -g fish_pager_color_description c3c6cf
set -g fish_pager_color_selected_background --background=1d4875

# fzf takes the same palette, so Ctrl-R and Ctrl-T match the terminal they open
# in. Appended to whatever options are already set rather than replacing them.
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#e1e2e8,bg:-1,hl:#a2c9fe \
--color=fg+:#e1e2e8,bg+:#1d4875,hl+:#a2c9fe \
--color=info:#bbc7db,prompt:#a2c9fe,pointer:#d8bde4 \
--color=marker:#d8bde4,spinner:#bbc7db,header:#c3c6cf \
--color=border:#43474e"
