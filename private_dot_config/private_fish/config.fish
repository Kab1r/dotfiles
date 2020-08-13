set -gxa PATH $HOME/.cargo/bin
set -gxa PATH $HOME/.local/bin
set -gxa PATH $HOME/.emacs.d/bin
set -gxa PATH $HOME/.bin

set -gx EDITOR emacs
starship init fish | source
