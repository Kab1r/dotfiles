set -gxa PATH $HOME/development/flutter/bin
set -gxa PATH $HOME/go/bin
set -gxa PATH /home/linuxbrew/.linuxbrew/bin
set -gxa PATH /home/linuxbrew/.linuxbrew/opt/openssl@1.1/bin
set -gxa PATH $HOME/.yarn/bin
set -gxa PATH $HOME/development/flutter/bin
set -gxa PATH $HOME/development/flutter/bin/cache/dart-sdk/bin
set -gxa PATH $HOME/.local/bin
set -gxa PATH $HOME/.cargo/bin

set -g fish_key_bindings fish_vi_key_bindings


starship init fish | source
