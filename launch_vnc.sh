# If you don't have root
# Nếu bạn dell có root
# git clone https://github.com/foxytouxxx/freeroot.git
# cd freeroot
# bash root.sh
# Nhớ gõ YES
# Dùng / Use
# sudo apt update && sudo apt install curl wget build-essential cmake make firefox kitty fluxbox openbox tigervnc-standalone-server git xterm websockify qemu-kvm qemu-system-x86 tint2
# hoặc / or
# apt update && apt install sudo curl wget build-essential cmake make firefox-esr kitty fluxbox openbox tigervnc-standalone-server git xterm websockify qemu-kvm qemu-system-x86 tint2
# git clone https://github.com/novnc/noVNC.git
printf "#!/bin/sh\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\nexec fluxbox" > ~/.vnc/xstartup
printf "#!/bin/sh\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\nexec fluxbox" > /root/.vnc/xstartup
chmod +x ~/.vnc/xstartup
chmod +x /root/.vnc/xstartup
mkdir -p ~/.vnc
touch ~/.vnc/passwd
chmod 600 ~/.vnc/passwd # Important for security
mkdir -p /root/.vnc
touch /root/.vnc/passwd
chmod 600 /root/.vnc/passwd # Important for security
# Ensure the .vnc directory exists for the root user
mkdir -p /root/.vnc
# Fast command curl -sSf https://raw.githubusercontent.com/Quanvm0501alt1/FreeVPSVNC/refs/heads/main/entrypoint.sh | sh -s run
# Create a minimal xstartup script for the VNC server
# This script tells VNC what desktop environment/window manager to launch
# cat << EOF > /root/.vnc/xstartup
# #!/bin/bash
# # Load X resources (optional)
# [ -r \$HOME/.Xresources ] && xrdb \$HOME/.Xresources
# # Start vncconfig to allow VNC client configuration
# vncconfig -iconic &
# # Start your desired desktop environment or window manager here
# # For example, to start Openbox and Tint2:
# openbox &
# tint2 &
# EOF
# # Make the xstartup script executable
# chmod +x /root/.vnc/xstartup

# cd noVNC/
# sudo vncserver -SecurityTypes none -rfbport 5080
# echo "Wait for 3 sec before start VNC client..."
# sleep 3
# sudo ./utils/novnc_proxy --vnc 127.0.0.1:5080 --listen localhost:8080
# cd ../
