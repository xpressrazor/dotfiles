# Fdisk

## List Drives

```sh
sudo fdisk -l
```

```txt
/dev/nvme1n1p1      2048    1230847    1228800   600M EFI System
/dev/nvme1n1p2   1230848  246786047  245555200 117.1G Linux filesystem
/dev/nvme1n1p3 246786048 2000409230 1753623183 836.2G Linux home
```

## Format the drives

Note: You may not want to format /home

```sh
mkfs.vfat /dev/nvme1n1p1
mkfs.ext4 /dev/nvme1n1p2
```

## Mount partitions
```sh
mount /dev/nvme1n1p2 /mnt
mkdir -P /mnt/home
mount /dev/nvme1n1p3 /mnt/home
mkdir -P /mnt/boot/efi
mount /dev/nvmen1p1 /mnt/boot/efi
```

## Install base
```sh
pacstrap /mnt base base-devel linux linux-firmware linux-headers networkmanager git
```

# Chroot
```sh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

Note: Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and run locale-gen

# Initialize
```sh
ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo archcomp > /etc/hostname
mkinitcpio -P
pacman -Syu
pacman -S grub efibootmgr os-prober 

# EFI
# Execute the following command to install the GRUB EFI application grubx64.efi to /boot/efi/EFI/GRUB and install its modules to /boot/grub/x86_64-efi/

grub-install --target=x86_64-efi --efi-directory=efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
```

## Enable Network Manager
```sh
systemctl enable NetworkManager
systemctl start NetworkManager
```

# Create user
```sh
pacman -S sudo neovim
useradd -m -g users -G wheel,storage,power -s /bin/bash someusername
passwd someusername
EDITOR=nvim visudo
```
Uncomment %wheel ALL=(ALL) ALL

# Enable multilib in /etc/pacman.conf and run pacman -Syu
# Change permission of /home/username (if you reused /home/username)
```sh
sudo chown -R userid:groupid /home/username
```

# Install rest of the packages
E.g. plasma-desktop firefox steam ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-droid ttf-dejavu ttf-bitstream-vera ttf-ubuntu-font-family unarchiver unrar vkd3d xf86-video-amdgpu libc++

# Install login manager
Like sddm

You can start sddm with `systemctl start sddm`. If everything looks good, enable it using `systemctl enable sddm`

# If you have nvidia card, install envycontrol and switch to hybrid to generate the configuration.
