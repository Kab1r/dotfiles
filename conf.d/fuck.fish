#!/usr/bin/env fish
if command -qs thefuck
    thefuck --alias | source
end
