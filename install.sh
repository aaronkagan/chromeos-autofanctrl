FILE=usr/local/Fanctrl/rebooted
if test -f "$FILE"; then
    sudo cp usr/local/Fanctrl/fanctrl-custom.conf /etc/init/
    sudo rm -rf usr/local/Fanctrl/rebooted
    echo "Installation is complete"
    echo "Chromebook will reboot in 5 seconds"
    sleep 5
    sudo reboot
    exit 1
fi

sudo crossystem dev_boot_signed_only=0
sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification
echo "Which partition to unlock?"
read partition_id
sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --partitions $partition_id
touch usr/local/Fanctrl/rebooted

echo "Chromebook will reboot in 5 seconds"
sleep 5
sudo reboot