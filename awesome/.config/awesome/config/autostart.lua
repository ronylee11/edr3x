local autostart = require('awful').spawn.with_shell

autostart('picom')
autostart('setxkbmap -option "caps:escape"')
autostart('nm-applet')
