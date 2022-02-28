#!/usr/bin/env fish
if command -qs starship
    set -gx STARSHIP_CONFIG $HOME/.config/fish/starship.toml
    starship init fish | source
end
