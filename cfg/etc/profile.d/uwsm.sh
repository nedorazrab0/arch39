# Start the compositor
set -e

uwsm check may-start \
  && exec uwsm start -N 'Hyprland' -- Hyprland -c /etc/hypr/hyprland.conf
