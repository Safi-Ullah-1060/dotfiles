#!/bin/bash
theme_path=`grep -m 1 -i "include" "$HOME/.config/kitty/kitty.conf"`
theme_path=`echo "${HOME}/.config/kitty/${theme_path/include }"`
opacity=`grep -m 1 -i "background_opacity" "$theme_path"`
opacity=`echo "${opacity/background_opacity }"`
echo $opacity
