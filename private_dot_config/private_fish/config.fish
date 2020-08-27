set -gxa PATH $HOME/.cargo/bin
set -gxa PATH $HOME/.local/bin
set -gxa PATH $HOME/.config/bin
set -gxa PATH $HOME/.emacs.d/bin
set -gxa PATH $HOME/.bin

set -gx EDITOR emacs

if [ -n $WSL_ENV ]
   set -x DISPLAY (grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0
end

starship init fish | source
