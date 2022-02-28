#!/usr/bin/env fish
function ssh
    if test "$TERM" = xterm-kitty
        kitty +kitten ssh $argv
    else
        command ssh $argv
    end
end
