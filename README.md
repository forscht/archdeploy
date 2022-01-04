# Arch Basic Install Commands-Script

In this repository you will find packages-scripts for the base install of Arch Linux and dwm Windows Manager.
Modify the packages to your liking, make the script executable with chmod +x scriptname and then run with ./scriptname.
Remember that the first part of the Arch Linux install is manual, that is you will have to partition, format and mount the disk yourself. Install the base packages and make sure to include git so that you can clone the repository in chroot.

A small summary:

1. If needed, load your keymap
2. Refresh the servers with pacman -Syy
3. Partition the disk
4. Format the partitions
5. Mount the partitions
6. Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git vim intel-ucode)
7. Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/FSTAB
8. Chroot in with arch-chroot /mnt
9. Download the git repository with git clone https://gitlab.com/forscht/archdeploy
10. cd archdeploy
11. chmod +x base.sh
12. run with ./base.sh
