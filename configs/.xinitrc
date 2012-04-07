#!/bin/bash
#!/bin/sh

# Make sure this is before the 'exec' command or it won't be executed.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

#sets the background with feh
sh ~/.fehbg &

#sets the time
while true; do
   xsetroot -name "$(date +"%F %R")"
   sleep 1m    # Update time every minute
done &

#autocutsel for unified clipboard!!
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#starts mpd
exec mpd
