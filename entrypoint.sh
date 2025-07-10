#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

# Define VNC display and geometry
VNC_DISPLAY=":1"
# VNC_GEOMETRY="1280x800" # Removed: vncserver will use its default
# VNC_DEPTH="24"         # Removed: vncserver will use its default
VNC_INTERNAL_PORT="5080" # Internal port for VNC server

# Ensure the .vnc directory exists for the root user
mkdir -p /root/.vnc

# Create a minimal xstartup script for the VNC server
# This script tells VNC what desktop environment/window manager to launch
cat << EOF > /root/.vnc/xstartup
#!/bin/bash
# Load X resources (optional)
[ -r \$HOME/.Xresources ] && xrdb \$HOME/.Xresources
# Start vncconfig to allow VNC client configuration
vncconfig -iconic &
# Start your desired desktop environment or window manager here
# For example, to start Openbox and Tint2:
openbox &
tint2 &
EOF
# Make the xstartup script executable
chmod +x /root/.vnc/xstartup

# Kill any existing VNC server session on the specified display
# The "|| true" prevents the script from failing if no session exists
echo "Attempting to kill any existing VNC server on display ${VNC_DISPLAY}..."
vncserver -kill "${VNC_DISPLAY}" || true

echo "Starting VNC server on display ${VNC_DISPLAY} (internal port ${VNC_INTERNAL_PORT})..."
# Start the VNC server in the background, without explicit geometry/depth
vncserver "${VNC_DISPLAY}" -rfbport "${VNC_INTERNAL_PORT}" -SecurityTypes None &

# Wait a moment for the VNC server to fully initialize
echo "Waiting for VNC server to initialize (5 seconds)..."
sleep 5

echo "Starting noVNC proxy..."
# Navigate to the noVNC directory
cd noVNC/

# Start the noVNC proxy
# It listens on 0.0.0.0:${PORT} (exposed by Docker)
# and proxies to the VNC server on 127.0.0.1:${VNC_INTERNAL_PORT} (localhost within the container)
# `exec` replaces the current shell process with novnc_proxy,
# so novnc_proxy becomes the main process of the container.
exec ./utils/novnc_proxy --vnc "127.0.0.1:${VNC_INTERNAL_PORT}" --listen "0.0.0.0:${PORT}"

# The container will run as long as the noVNC proxy is running.
