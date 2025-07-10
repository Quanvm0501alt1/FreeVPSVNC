# If you don't have root
# Nếu bạn dell có root
# git clone https://github.com/foxytouxxx/freeroot.git
# cd freeroot
# bash root.sh
# Nhớ gõ YES
# Dùng / Use
# sudo apt update && sudo apt install curl wget build-essential cmake make firefox kitty fluxbox openbox tigervnc-standalone-server git xterm x11-xserver-output-drivers websockify qemu-kvm qemu-system-x86 tint2
# hoặc / or
# apt update && apt install sudo curl wget build-essential cmake make firefox-esr kitty fluxbox openbox tigervnc-standalone-server git xterm x11-xserver-output-drivers websockify qemu-kvm qemu-system-x86 tint2
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
cd noVNC/
sudo vncserver -SecurityTypes none -xstartup "openbox" -rfbport 5080
echo "Wait for 3 sec before start VNC client..."
sleep 3
sudo ./utils/novnc_proxy --vnc 127.0.0.1:5080 --listen localhost:8080
cd ../
