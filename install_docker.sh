   #!/bin/bash
   apt install git curl build-essential wget -y
   timedatectl set-timezone America/Sao_Paulo
   bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
   bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
   echo 0 > /sys/class/vtconsole/vtcon1/bind
   service lightdm stop
   rmmod nouveau
   update-grub
   update-initramfs -u
   wget -c https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda_12.2.2_535.104.05_linux.run
   chmod 755 cuda_12.2.2_535.104.05_linux.run
   ./cuda_12.2.2_535.104.05_linux.run --override --driver --toolkit --silent
