#!/bin/bash

USERNAME="forscht"
TIMEZONE="Asia/Kolkata"
HOSTNAME="local"
PASSWORD="PASSWORD"

ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo $HOSTNAME >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo "root:$PASSWORD" | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr networkmanager dialog pulseaudio wpa_supplicant mtools dosfstools reflector base-devel linux-headers xdg-user-dirs xdg-utils gvfs nfs-utils inetutils dnsutils cups alsa-utils openssh reflector acpi acpi_call tlp dnsmasq openbsd-netcat ipset sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable cups.service
systemctl enable sshd
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

useradd -m $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers.d/$USERNAME

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




