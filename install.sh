echo "Downloading files"
mkdir /usr/local/Fanctrl
cd /usr/local/Fanctrl
curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/LICENSE"
curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/README.md"
curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/fanctrl.sh"
curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/install.sh"

echo "Installing script"
crossystem dev_boot_signed_only=0
/usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification
echo "Which partition to unlock?"
read partition_id
/usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --partitions $partition_id

echo "Chromebook will reboot in 5 seconds"
sleep 5
sudo reboot
