#!/usr/bin/env fish
if command -qs emacsclient
    set -gx EDITOR "emacsclient -nw -c"
else if command -qs emacs
    set -gx EDITOR "emacs -nw"
else if command -qs vim
    set -gx EDITOR vim
else if command -qs vi
    set -gx EDITOR vi
end

if command -qs emacsclient
    set -gx VISUAL "emacsclient -c"
else if command -qs emacs
    set -gx VISUAL "emacs -c"
else if command -qs code
    set -gx VISUAL code
end
