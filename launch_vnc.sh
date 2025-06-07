# If you don't have root
# Nếu bạn dell có root
# git clone https://github.com/foxytouxxx/freeroot.git
# cd freeroot
# bash root.sh
# Nhớ gõ YES
# Dùng / Use
# sudo apt update && sudo apt install tigervnc-standalone-server qemu-kvm qemu-system-x86 openbox firefox neofetch kitty
# hoặc / or
# apt install sudo curl wget build-essential cmake make firefox kitty fluxbox openbox tigervnc-standalone-server git xterm x11-xserver-output-drivers websockify
# git clone https://github.com/novnc/noVNC.git
printf "#!/bin/sh\n\
unset SESSION_MANAGER\n\
unset DBUS_SESSION_BUS_ADDRESS\n\
exec fluxbox"
cd noVNC/
sudo vncserver -SecurityTypes none -xstartup "openbox" -rfbport 5080
echo "Wait for 3 sec before start VNC client..."
sleep 3
sudo ./utils/novnc_proxy --vnc 127.0.0.1:5080 --listen localhost:8080
cd ../
