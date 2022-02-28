#!/usr/bin/env fish
if command -qs sh and command -qs sed and command -qs bat
    set -gx MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p --theme Dracula'"
end
