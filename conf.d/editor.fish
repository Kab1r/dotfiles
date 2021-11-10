#!/usr/bin/env fish

# Terminal Editor
if command -qs emacsclient
    set EDITOR "emacsclient -c"
else if command -qs emacs
    set EDITOR emacs
else if command -qs vim
    set EDITOR vim
end

# Visual Editor
if command -qs code
    set VISUAL code
end
