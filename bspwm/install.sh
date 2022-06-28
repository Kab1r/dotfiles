#!/usr/bin/env bash

script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
config_dir="$HOME/.config"
modules=(polybar sxhkd rofi)

for module in $modules; do
    rm -ri $script_dir/$module $config_dir/$module
    ln -si $script_dir/$module $config_dir/$module
done
