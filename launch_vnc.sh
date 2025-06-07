# git clone https://github.com/foxytouxxx/freeroot.git
# cd freeroot
# bash root.sh
# sudo apt update && sudo apt install tigervnc-standalone-server qemu-kvm qemu-system-x86 openbox firefox neofetch kitty
# git clone https://github.com/novnc/noVNC.git
cd noVNC/
sudo vncserver -SecurityTypes none -xstartup "openbox" -rfbport 5080
echo "Wait for 3 sec before start VNC client..."
sleep 3
sudo ./utils/novnc_proxy --vnc 127.0.0.1:5080 --listen localhost:8080
cd ../
