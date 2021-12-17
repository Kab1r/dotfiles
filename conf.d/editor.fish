#!/usr/bin/env fish

# Terminal Editor
if command -qs emacsclient
    set -gx EDITOR "emacsclient -c"
else if command -qs emacs
    set -gx EDITOR emacs
else if command -qs vim
    set -gx EDITOR vim
end

# Visual Editor
if command -qs code
    set -gx VISUAL code
end
