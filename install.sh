if [ "$1" = "-rebooted" ]; then
  echo "Installing part 2/2."
  cp /usr/local/Fanctrl/fanctrl-custom.conf /etc/init/
  echo "Installation is complete."
else    
  echo "Installing part 1/2."
  mkdir /usr/local/Fanctrl
  cd /usr/local/Fanctrl
  curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/LICENSE"
  curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/README.md"
  curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/fanctrl.sh"
  curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/fanctrl-custom.conf"
  
  echo "Extracting files."
  crossystem dev_boot_signed_only=0
  echo "Removing read-write protection"
  partition_id=$(sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification | grep -m1 -o "partitions.*")
  /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --$partition_id
fi

echo "Chromebook will reboot in 5 seconds."
sleep 5
reboot
exit 1
