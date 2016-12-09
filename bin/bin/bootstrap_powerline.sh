#!/bin/bash
mkdir -p ~/.config/fontconfig/conf.d
curl -L -o ~/.fonts/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
curl -L -o ~/.config/fontconfig/conf.d https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -fv ~/.fonts
