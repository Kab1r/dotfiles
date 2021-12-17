#!/usr/bin/env fish

if command -qs bat
    set -gx MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
end

