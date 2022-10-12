#!/usr/bin/env fish
set -gxa PATH $HOME/.local/bin

if command -qs cargo
    set -gxa PATH $HOME/.cargo/bin
end

if command -qs deno
    set -gxa PATH $HOME/.deno/bin
end

if command -qs dart
    set -gxa PATH $HOME/.pub-cache/bin
end

if command -qs emacs
    set -gxa PATH $HOME/.emacs.d/bin
end

set -gxa PATH /opt/depot_tools
